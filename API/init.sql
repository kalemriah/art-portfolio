-- Drop existing table if it exists
DROP TABLE IF EXISTS "public.artwork";

-- Create sequence for auto-incrementing IDs
CREATE SEQUENCE IF NOT EXISTS "public.artwork_id_seq";

-- Create the artwork table
CREATE TABLE "public.artwork" (
    "id" int4 NOT NULL DEFAULT nextval('"public.artwork_id_seq"'::regclass),
    "title" text NOT NULL,
    "filelocation" text NOT NULL,
    "medium" text,
    "main_colors" text,
    PRIMARY KEY ("id")
);

-- Insert your existing artworks
INSERT INTO "public.artwork" ("id", "title", "filelocation", "medium", "main_colors") VALUES
(1, 'Reflection', '/public/images/001', 'watercolor, collage', 'yellow, blue'),
(2, 'OddBird', '/public/images/002', 'watercolor, paintsticks', 'blue, pink'),
(3, 'MushroomGuy', '/public/images/003', 'watercolor', 'purple'),
(4, 'Storm', '/public/images/004', 'watercolor, collage', 'purple, blue, green'),
(5, 'Greetings', '/public/images/005', 'watercolor, collage, marker', 'purple, green, brown'),
(6, 'Flowers', '/public/images/006', 'watercolor, collage', 'green, purple, brown'),
(7, 'Fellas', '/public/images/007', 'watercolor, collage, marker', 'purple, green, brown'),
(8, 'Skull', '/public/images/008', 'watercolor, collage, marker', 'brown, purple'),
(9, 'GhostCat', '/public/images/009', 'watercolor', 'purple'),
(10, 'Upwards', '/public/images/010', 'watercolor, charcoal, collage', 'blue, purple'),
(11, 'AlienCity', '/public/images/011', 'watercolor, charcoal, collage', 'blue, purple'),
(12, 'CavePaintings', '/public/images/012', 'watercolor, marker, collage, paintsticks', 'red'),
(13, 'OntheFlipside', '/public/images/013', 'watercolor, collage, marker', 'blue'),
(14, '3chats', '/public/images/014', 'paintsticks, markers', 'red, purple, blue, green'),
(15, 'Nelly', '/public/images/015', 'watercolor, paintsticks', 'pink, green'),
(16, 'NellySkater', '/public/images/016', 'watercolor, paintsticks, collage', 'pink, green'),
(17, 'Geometrics', '/public/images/017', 'paintsticks', 'green, orange, blue'),
(18, 'Tension', '/public/images/018', 'paintsticks, collage', 'purple, brown, blue'),
(19, 'Dragon', '/public/images/019', 'watercolor, paintsticks', 'blue, pink'),
(20, 'Nephew', '/public/images/020', 'paintsticks, watercolor, collage', 'orange, pink, green'),
(21, 'ClownStare', '/public/images/021', 'watercolor, paintsticks', 'orange, red, blue'),
(22, 'Mantis', '/public/images/022', 'paintsticks, watercolor', 'green, blue'),
(23, 'Alien', '/public/images/023', 'watercolor, marker, collage, paintsticks', 'green, black'),
(24, 'MEOW', '/public/images/024', 'paintsticks, marker', 'yellow, blue, green'),
(25, 'BatCat', '/public/images/025', 'paintsticks, marker', 'green, black'),
(26, 'Ash', '/public/images/026', 'paintsticks', 'purple, red, green'),
(27, 'PinkNelly', '/public/images/027', 'paintsticks, watercolor', 'pink, purple'),
(28, 'VolcanicNosepick', '/public/images/028', 'collage', 'red'),
(29, 'Kiwi', '/public/images/029', 'paintsticks, marker', 'red, green'),
(30, 'Horse', '/public/images/030', 'paintsticks', 'green, pink'),
(31, 'ThankYou', '/public/images/031', 'collage, marker, paintsticks', 'green, blue'),
(32, 'Spider', '/public/images/032', 'collage', 'blue, green'),
(33, 'Dimple', '/public/images/033', 'marker, paintsticks, collage', 'green, pink'),
(34, 'RidingWave', '/public/images/034', 'paintsticks', 'blue'),
(35, 'DreamGuide', '/public/images/035', 'collage, colorpencil, paintsticks', 'red, yellow, blue'),
(36, 'FlowerField', '/public/images/036', 'paintsticks', 'blue, yellow'),
(37, 'RoughSelfPortait', '/public/images/037', 'paintsticks', 'blue, yellow, pink'),
(38, 'OneFootBSSmith', '/public/images/038', 'collage, paintsticks, marker', 'blue, green'),
(39, 'BusStop', '/public/images/039', 'marker, paintstick', 'blue, orange'),
(40, 'Altered', '/public/images/040', 'watercolor, paintstick', 'blue, pink'),
(41, 'Alaskan', '/public/images/041', 'charcoal, paintstick', 'black'),
(42, 'Ghost', '/public/images/042', 'paintstick, marker', 'blue, purple'),
(43, 'FunnyField', '/public/images/043', 'collage', 'pink, green, yellow'),
(44, 'Unsweet', '/public/images/044', 'paintstick, charcoal', 'orange, yellow'),
(45, 'Clowns', '/public/images/045', 'paintstick', 'red, yellow'),
(46, 'CavePaintings', '/public/images/046', 'collage, paintstick', 'red, yellow, green'),
(47, 'TrollfaceTerrorfier', '/public/images/047', 'paintstick', 'black, yellow'),
(48, 'TrollfaceTerrorfier2', '/public/images/048', 'paintstick', 'black, yellow'),
(49, 'Soulmates', '/public/images/049', 'collage', 'blue'),
(50, 'Soulmates2', '/public/images/050', 'collage', 'red'),
(51, 'Soulmates3', '/public/images/051', 'collage', 'pink, blue'),
(52, 'Quantum', '/public/images/052', 'collage', 'red, pink, black'),
(53, 'Quantum2', '/public/images/053', 'collage', 'black, pink, red'),
(54, 'Quantum3', '/public/images/054', 'collage', 'black, pink, red, orange'),
(55, 'Quantum4', '/public/images/055', 'collage', 'black, red, pink');

-- Reset the sequence to the correct value (important for auto-increment)
SELECT setval('"public.artwork_id_seq"', (SELECT MAX(id) FROM "public.artwork"));