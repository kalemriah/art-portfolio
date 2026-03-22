"""Main application file for FastAPI API interacting with PostgreSQL database"""
from fastapi import FastAPI, HTTPException, UploadFile, File
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import psycopg2
import os
import shutil

"""FastAPI application instance"""
app = FastAPI()

"""CORS middleware configuration to allow requests from any origin, with any method and headers (using * as wildcard).
This is useful for development and testing purposes, but in production, it's advisable to restrict origins for security reasons. 
So once uploaded to say azure, you will need to secure this"""
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:8084"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

"""Function to get a database connection. A new connection is created for each request. 
This is a simple approach; for production, consider using connection pooling for better performance."""
def get_db_connection():
    conn = psycopg2.connect(
        host=os.environ.get("DATABASE_HOST", "db"),
        database=os.environ.get("DATABASE_NAME", "artwork"),
        user=os.environ.get("DATABASE_USER", "postgres"),
        password=os.environ.get("DATABASE_PASSWORD")
    )
    return conn

"""Pydantic model for Artwork data validation. This model defines the structure of artwork data that will be sent and received via the API."""
class Artwork(BaseModel):
    title: str
    filelocation: str
    medium: str = None
    main_colors: str = None

"""Root Route. Simple liveness check endpoint. Good for verifying the API is running."""
@app.get("/")
def read_root():
    return {"message": "Art Gallery API"}

"""Endpoint to retrieve all artworks from the database"""
@app.get("/artworks")
def get_artworks():
    conn = get_db_connection()
    cur = conn.cursor()
    
    cur.execute('SELECT id, title, filelocation, medium, main_colors FROM "public.artwork"')
    artworks = cur.fetchall()
    
    cur.close()
    conn.close()
    
    result = []
    for artwork in artworks:
        result.append({
            "id": artwork[0],
            "title": artwork[1],
            "filelocation": artwork[2],
            "medium": artwork[3],
            "main_colors": artwork[4]
        })
    
    return {"artworks": result}

"""Endpoint to create a new artwork in the database"""
@app.post("/artworks")
def create_artwork(artwork: Artwork):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute(
        'INSERT INTO "public.artwork" (title, filelocation, medium, main_colors) VALUES (%s, %s, %s, %s) RETURNING id',
        (artwork.title, artwork.filelocation, artwork.medium, artwork.main_colors)
    )
    artwork_id = cur.fetchone()[0]
    conn.commit()
    cur.close()
    conn.close()
    return {"id": artwork_id, "message": "Artwork created"}

"""Endpoint to update an existing artwork in the database"""
@app.put("/artworks/{artwork_id}")
def update_artwork(artwork_id: int, artwork: Artwork):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute(
        'UPDATE "public.artwork" SET title=%s, filelocation=%s, medium=%s, main_colors=%s WHERE id=%s',
        (artwork.title, artwork.filelocation, artwork.medium, artwork.main_colors, artwork_id)
    )
    if cur.rowcount == 0:
        cur.close()
        conn.close()
        raise HTTPException(status_code=404, detail="Artwork not found")
    conn.commit()
    cur.close()
    conn.close()
    return {"message": "Artwork updated"}

"""Endpoint to delete an artwork from the database"""
@app.delete("/artworks/{artwork_id}")
def delete_artwork(artwork_id: int):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('DELETE FROM "public.artwork" WHERE id=%s', (artwork_id,))
    if cur.rowcount == 0:
        cur.close()
        conn.close()
        raise HTTPException(status_code=404, detail="Artwork not found")
    conn.commit()
    cur.close()
    conn.close()
    return {"message": "Artwork deleted"}

"""Endpoint to handle file uploads. Automatically generates the next sequential ID and saves the image."""
@app.post("/upload")
async def upload_file(file: UploadFile = File(...)):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT MAX(id) FROM "public.artwork"')
    max_id = cur.fetchone()[0]
    cur.close()
    conn.close()
    
    next_id = (max_id or 0) + 1
    filename = f"{next_id:03d}.jpg"
    
    file_path = f"/app/public/images/{filename}"
    os.makedirs("/app/public/images", exist_ok=True)
    
    with open(file_path, "wb") as buffer:
        shutil.copyfileobj(file.file, buffer)
    
    return {"filelocation": f"/public/images/{next_id:03d}", "filename": filename}