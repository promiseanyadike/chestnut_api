-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1-alpha1
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.com.br
-- Model Author: ---


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database
-- ;
-- -- ddl-end --
-- 

-- object: public.students | type: TABLE --
-- DROP TABLE IF EXISTS public.students CASCADE;
CREATE TABLE public.students(
	id serial NOT NULL,
	matric_no varchar(15) NOT NULL,
	program_id bigint NOT NULL,
	current_year smallint NOT NULL,
	current_semester smallint NOT NULL,
	student_current_session_id bigint NOT NULL,
	entry_year integer NOT NULL,
	application_status smallint NOT NULL DEFAULT 0,
	moodle_user_id bigint NOT NULL,
	CONSTRAINT pk_students_id PRIMARY KEY (id),
	CONSTRAINT uq_students_matric_no UNIQUE (matric_no)

);

-- ddl-end --
COMMENT ON TABLE public.students IS 'To contain additional details of admitted students';
-- ddl-end --
COMMENT ON COLUMN public.students.current_year IS 'The current year refers to the present level of the student';
-- ddl-end --
COMMENT ON COLUMN public.students.current_semester IS 'current_semester refers to the present semester';
-- ddl-end --
COMMENT ON COLUMN public.students.student_current_session_id IS 'student_current_session_id refers to the current session of the student';
-- ddl-end --
COMMENT ON COLUMN public.students.application_status IS 
'application_status refers to the current status of the student where 0 means that the student is yet to pay as a fresher and 1 means the student is already a student';
--ddl-end --
COMMENT ON COLUMN public.students.moodle_user_id IS 'moodle_user_id refers to the moodle user id of the student';


-- Appended SQL commands --
INSERT INTO public.students 
(id,matric_no,program_id,current_year,current_semester,student_current_session_id,entry_year, application_status,moodle_user_id ) 
VALUES 
(0,'None',0,0,0,0,0000, 0, 0);

INSERT INTO public.students 
(id,matric_no,program_id,current_year,current_semester,student_current_session_id,entry_year, application_status, moodle_user_id) 
VALUES 
(2,'BMS/16/0001',1,2,1,3,2016, 1, 8),
(3,'BMS/16/0002',1,2,1,3,2016, 1, 9),

(4,'ECO/17/0001',3,1,1,3,2017, 1, 10),
(5,'ECO/17/0002',3,1,1,3,2017, 1, 11)

;

-- object: public.settings | type: TABLE --
-- DROP TABLE IF EXISTS public.settings CASCADE;
CREATE TABLE public.settings(
	id serial NOT NULL,
	name varchar(50) NOT NULL,
	value bigint NOT NULL,
	CONSTRAINT pk_settings_id PRIMARY KEY (id)
);

-- ddl-end --
COMMENT ON COLUMN public.settings.name IS 'The name for the particular settings';
-- ddl-end --
COMMENT ON COLUMN public.settings.value IS 'The current value for the given setting is given here';
-- ddl-end --


INSERT INTO public.settings
(name, value) VALUES 
('current academic session', 3),
('current academic semester', 5)
;


-- object: public.courses | type: TABLE --
-- DROP TABLE IF EXISTS public.courses CASCADE;
CREATE TABLE public.courses(
	id bigserial NOT NULL,
	department_id smallint,
	code varchar(10) NOT NULL,
	name varchar(350) NOT NULL,
	description text NOT NULL,
	units smallint NOT NULL,
	moodle_course_id bigint NOT NULL,
	CONSTRAINT pk_courses_id PRIMARY KEY (id)
	-- CONSTRAINT uq_course_code UNIQUE (code)

);
-- ddl-end --
COMMENT ON COLUMN public.courses.description IS 'gives information about the course';
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.courses (id,department_id,code,name, description, units, moodle_course_id) VALUES 
(0,0,'OOO','None','Nothing',0, 0);

INSERT INTO public.courses (department_id,code,name,description, units, moodle_course_id) VALUES
(1, 'GST 111', 'Communication in English I', 'Communication in English I', 2, 5),
(1, 'GST 112', 'Logic, Philosophy and Human Existence', 'Logic, Philosophy and Human Existence', 2, 11),
(1, 'GST 113','Nigerian Peoples and Culture', 'Nigerian Peoples and Culture', 2, 22),
(1, 'GST 121', 'Use of Library, Study Skills and ICT', 'Use of Library, Study Skills and ICT', 2, 14),
(1, 'GST 122', 'Communication in English II', 'Communication in English II', 2, 12),
(1, 'GST 123', 'Basic Communication in French', 'Basic Communication in French', 2, 26),
(1, 'GST 124', 'Basic Communication in Arabic', 'Basic Communication in Arabic', 2, 27),
(1, 'GST 125', 'Basic Communication in Chinese', 'Basic Communication in Chinese', 2, 28),
(1, 'GST 126', 'Contemporary Health Issues', 'Contemporary Health Issues', 2, 29),
(1, 'WMU 101', 'Intensive English I', 'Intensive English I', 2, 30),
(1, 'WMU 102', 'Intensive English II', 'Intensive English II', 2, 31),
(1, 'WMU 103', 'Public Speaking', 'Public Speaking', 2,32),
(1, 'WMU 104', 'E-Learning Fundamentals', 'E-Learning Fundamentals', 2, 33),
(1, 'WMU 105', 'Advance E learning skills and practice', 'Advance E learning skills and practice', 2, 34),
(1, 'WMU 104', 'Basic Mathematics [1]', 'Basic Mathematics [1]', 2, 35),
(1, 'WMU 121', 'Analysis of Scientific Data', 'Analysis of Scientific Data', 2, 36),
(1, 'GST 311', 'Environment and Sustainable Development', 'Environment and Sustainable Development', 2, 37),
(1, 'GST 322', 'Peace and Conflict Resolution', 'Peace and Conflict Resolution', 2, 38),
(1, 'GST 323', 'Introduction to Entrepreneurial Skills', 'Introduction to Entrepreneurial Skills', 2, 39),
(1, 'GST 324', 'Leadership Skills', 'Leadership Skills', 2, 40),
(1, 'GST 411', 'Entrepreneurship Studies', 'Entrepreneurship Studies', 2, 41),

(1, 'FMS 200', 'Introduction to the Film Medium', 'Introduction to the Film Medium', 3, 50),
(1, 'FMS 221', 'A survey of world film and Media Studies 1', 'A survey of world film and Media Studies 1', 3, 51),
(1, 'MDA 210', 'Intermediate filmaking', 'Intermediate filmaking', 3, 52),
(1, 'MDA 230', 'Foundation of mass communication', 'Foundation of mass communication', 3, 53),
(1, 'COM 100', 'Oral Communication Theory', 'Oral Communication Theory', 2, 54),
(1, 'COM 210', 'Concepts in communication and journalism', 'Concepts in communication and journalism', 2, 55),
(1, 'MDA 235', 'Introduction to film studies', 'Introduction to film studies', 2, 56),
(1, 'MDA 242', 'Introduction to filmmaking', 'Introduction to filmmaking', 2, 57),
(1, 'MDA 270', 'Introduction to visual media', 'Introduction to visual media', 2, 58),
(1, 'MDA 282', 'Sequence design', 'Sequence design', 3, 59),
(1, 'FMS 300', 'Film and Media Aesthetics', 'Film and Media Aesthetics', 3, 62),
(1, 'FMS 372', 'Basic Screenwriting', 'Basic Screenwriting I', 3, 63),
(1, 'FMS 373', 'Basic Screenwriting', 'Basic Screenwriting II', 3, 64),
(1, 'FMS 375', 'Basic Video Production', 'Basic Video Production', 3, 65),
(1, 'MDA 294', 'Visual Media Projects', 'Visual Media Projects', 3, 66),
(1, 'MDA 292', 'Internship', 'Internship', 3, 67),
(1, 'FMS 414', 'History of African-American Images in Film', 'History of African-American Images in Film', 3, 68),
(1, 'FMS 415', 'Survey of Japanese Film', 'Survey of Japanese Film', 3, 69),
(1, 'FMS 416', 'Cinemas of the Southern Americas, Argentina, Chile and Uruguay', 'Cinemas of the Southern Americas, Argentina, Chile and Uruguay', 3, 70),
(1, 'FMS 445', 'New Media and Society', 'New Media and Society', 3, 71),
(1, 'FMS 474', 'Animation', 'Animation', 3, 72),
(1, 'FMS 480', 'Popular Culture', 'Popular Culture', 3, 73),
(1, 'FMS 410', 'History of the Silent Film', 'History of the Silent Film', 3, 74),
(1, 'FMS 411', 'History of American Sound Film', 'History of American Sound Film', 3, 75),
(1, 'FMS 412', 'History of International Sound Film to 1950', 'History of International Sound Film to 1950', 3, 76),
(1, 'FMS 413', 'History of International Sound Film Post 1950', 'History of International Sound Film Post 1950', 3, 77),
(1, 'FMS 501', 'Undergraduate Professional Development Seminar', 'Undergraduate Professional Development Seminar', 3, 78),
(1, 'FMS 520', 'International Women Filmmakers', 'International Women Filmmakers', 3, 79),
(1, 'FMS 521', 'American Film Criticism', 'American Film Criticism', 3, 80),
(1, 'DMS 530', 'Classical Film/Media Theory', 'Classical Film/Media Theory', 3, 81),
(1, 'FMS 551', 'Project ', 'Project ', 6, 82),
(1, 'FMS 592', 'Capstone in Film and Media Studies ', 'Capstone in Film and Media Studies ', 3, 83),
(1, 'FMS 593', 'Experimental Film and Video', 'Experimental Film and Video', 3, 84),
(1, 'CLT 206', 'The Body Now: Matter, Form, and Text ', 'The Body Now: Matter, Form, and Text ', 3, 85),
(1, 'CLT 210', 'Introduction to Literary and Cultural Theory ', 'Introduction to Literary and Cultural Theory ', 3, 86),
(1, 'CLT 245', 'Film History/Theory I', 'Film History/Theory I', 3, 87),
(1, 'CLT 249', 'Linguistic Anthropology', 'Linguistic Anthropology', 3, 88),
(1, 'CLT 250 ', 'African Traditional Medicine and Practices / Medical Anthropology', 'African Traditional Medicine and Practices / Medical Anthropology', 3, 89),
(1, 'CLT 251', 'African Histories and Settlement Patterns', 'African Histories and Settlement Patterns', 3, 90),
(1, 'CLT 252', 'African Arts and Crafts', 'African Arts and Crafts', 3, 91),
(1, 'CLT 253', 'Nutrition, Food, Beverages and Recipes', 'Nutrition, Food, Beverages and Recipes', 3, 92),
(1, 'CLT 254', 'Costumes, Fashion, Concepts of Beauty.', 'Costumes, Fashion, Concepts of Beauty, Beauty Treatment.', 3, 93),
(1, 'CLT 255', 'African Social Community Organisations', 'African Social Community Organisations', 3, 112),
(1, 'CLT 256', 'Lifestyle, Entertainment and Leisure', 'Lifestyle, Entertainment and Leisure', 3, 94),
(1, 'CLT 257', 'Festivals and Celebrations', 'Festivals and Celebrations', 3, 95),
(1, 'CLT 258', 'Cosmogony', 'Cosmogony', 3, 96),
(1, 'CLT 259', 'The Sociology of Aging', 'The Sociology of Aging', 3, 97),
(1, 'CLT 261', 'Nineteenth‐Century Russian Poetry', 'Nineteenth‐Century Russian Poetry', 3, 98),
(1, 'CLT 285', 'Gender, Technics, and Media from Plato to Video Games ', 'Gender, Technics, and Media from Plato to Video Games ', 3, 99),
(1, 'CLT 330', 'Rhetoric and Culture: Rhetoric of Space and Place', 'Rhetoric and Culture: Rhetoric of Space and Place', 3, 100),
(1, 'CLT 200', 'Literary Studies', 'Literary Studies', 3, 101),
(1, 'CLT 202', 'Museum Studies Exhibition Seminar ', 'Museum Studies Exhibition Seminar ', 3, 102),
(1, 'CLT 220', 'Theories of Theatre and Drama: Performance Studies', 'Theories of Theatre and Drama: Performance Studies', 3, 103),
(1, 'CLT 222', 'Media and Cultural Studies: Media Materialisms', 'Media and Cultural Studies: Media Materialisms', 3, 104),
(1, 'CLT 225', 'Theories of Gender and Sexuality', 'Theories of Gender and Sexuality', 3, 105),
(1, 'CLT 234', 'Cultural Sociology ', 'Cultural Sociology ', 3, 106),
(1, 'CLT 237', 'Latin American 20th Century Topics: The Baroque', 'Latin American 20th Century Topics: The Baroque', 3, 107),
(1, 'CLT 240', 'Studies in Visual Knowledge', 'Studies in Visual Knowledge', 3, 108),
(1, 'CLT 246', 'Gamaliel Churata, the Makers of la Vanguardia Plebeya del Titikaka, and the Resurrection of the Dead', 'Gamaliel Churata, the Makers of la Vanguardia Plebeya del Titikaka, and the Resurrection of the Dead', 3, 109),
(1, 'CLT 273', 'Power and Inequality Core Course', 'Power and Inequality Core Course', 3, 110),
(1, 'CLT 333', 'Religion and Worship, Taboos and Abominations', 'Religion and Worship, Taboos and Abominations', 3, 111),
(1, 'CLT 210_2', 'Medieval Encounters with the Other: Politics, Religion, and Race', 'Medieval Encounters with the Other: Politics, Religion, and Race', 3, 113),
(1, 'CLT 252_2', 'Special Topics: Galileo and All That', 'Special Topics: Galileo and All That', 3, 114),
(1, 'CLT 203', 'Music, Culture, and Technology: Jazz and Film--Representation, Sound, and Improvisation in Cinema ', 'Music, Culture, and Technology: Jazz and Film--Representation, Sound, and Improvisation in Cinema ', 3, 115),
(1, 'CLT 212', 'Law and Civil Security', 'Law and Civil Security', 3, 116),
(1, 'CLT 213', 'Human Rights Politics and Practice', 'Human Rights Politics and Practice', 3, 117),
(1, 'CLT 218', 'Intellectual Property and Open Movements', 'Intellectual Property and Open Movements', 3, 118),
(1, 'CLT 222_2', 'Special Topics in Cultural Analysis: Afrolatinidades', 'Special Topics in Cultural Analysis: Afrolatinidades', 3, 119),
(1, 'CLT 242', 'Colonial Topics: Indigenous Colonial Thinkers in the Andes', 'Colonial Topics: Indigenous Colonial Thinkers in the Andes', 3, 120),
(1, 'CLT 247', 'Anti‐Imperialist Empire: Formations of Second‐World Culture', 'Anti‐Imperialist Empire: Formations of Second‐World Culture ', 3, 121),
(1, 'CLT 250_2', 'Seminar: 19th Century Topic', 'Seminar: 19th Century Topic', 3, 122),
(1, 'CLT 272', 'Theory and Method in Atlantic History', 'Theory and Method in Atlantic History ', 3, 123),
(1, 'CLT 444', 'Feminist Social Work.', 'Feminist Social Work.', 3, 124),
(1, 'CLT 201', 'Culturally Responsive Pedagogy', 'Culturally Responsive Pedagogy', 3, 125),
(1, 'CLT 204', 'Bollywood, Nollywood and Beyond: Popular Films and Music in Asia and Africa', 'Bollywood, Nollywood and Beyond: Popular Films and Music in Asia and Africa ', 3, 126),
(1, 'CLT 214', 'Race and Racism in Education and Society', 'Race and Racism in Education and Society', 3, 127),
(1, 'CLT 220_2', 'African Government and Politics', 'African Government and Politics ', 3, 128),
(1, 'CLT 227', 'African Language Typologies and Language Contact', 'African Language Typologies and Language Contact', 3, 129),
(1, 'CLT 235', 'Gender and Development', 'Gender and Development', 3, 130),
(1, 'CLT 244', 'Expressionism', 'Expressionism', 3, 131),
(1, 'CLT 249_2', 'Digital Pedagogy', 'Digital Pedagogy', 3, 132),
(1, 'CLT 260', 'Special Topics: Chinese Art', 'Special Topics: Chinese Art', 3, 133),
(1, 'CLT 263', 'Technology in the Lives of Children and Youth', 'Technology in the Lives of Children and Youth', 3, 134),
(1, 'CLT 360', 'The Digital and the Humanities', 'The Digital and the Humanities', 3, 135),
(1, 'CLT 590', 'Research Methodologies in Cultural Studies', 'Research Methodologies in Cultural Studies ', 6, 136),
(2, 'ENG 132', 'TEF Experience II', 'TEF Experience II', 3, 137),
(2, 'ENG 133', 'TEF Experience I', 'TEF Experience I ', 3, 138),
(2, 'COM 101', 'Freedom of Communication', 'Freedom of Communication.', 2, 139),
(2, 'COM 202', 'Principles of Argumentation', 'Principles of Argumentation.', 2, 140),
(2, 'COM 204', 'Analysis and Briefing', 'Analysis and Briefing', 2, 141),
(2, 'COM 205', 'Conspiracy Theories, Media, and Middle East', 'Conspiracy Theories, Media, and Middle East ', 2, 142),
(2, 'COM 209', 'Entrepreneurial Communication', 'Entrepreneurial Communication. ', 2, 143),
(2, 'COM 210_2', 'Gender and Communication', 'Gender and Communication. ', 2, 144),
(2, 'COM 211', 'Theories of Persuasion', 'Theories of Persuasion. ', 2, 145),
(2, 'COM 212', 'Communication Theory', 'Communication Theory. ', 2, 146),
(2, 'COM 213', 'Forensics I', 'Forensics I.  ', 2, 147),
(2, 'COM 214', 'Forensics II', 'Forensics II.   ', 2, 148),
(2, 'COM 215', 'Principles of Rhetorical Criticism', 'Principles of Rhetorical Criticism ', 2, 149),
(2, 'COM 220', 'Theories of Argumentation', 'Theories of Argumentation ', 2, 150),
(2, 'COM 221', 'Speech Writing Theory and Practice', 'Speech Writing Theory and Practice ', 2, 151),
(2, 'COM 225', 'Communication and Culture', 'Communication and Culture  ', 2, 152),
(2, 'COM 227', 'Communication and Technology', 'Communication and Technology ', 2, 153),
(2, 'COM 229', 'Communication Technology, Community, and Personal Identity', 'Communication Technology, Community, and Personal Identity ', 2, 154),
(2, 'COM 232', 'Synopsis', 'Synopsis', 2, 155),
(2, 'COM 241', 'Theories of Relational Communication', 'Theories of Relational Communication ', 2, 156),
(2, 'GEO 211', 'Elements of Human Geography', 'Elements of Human Geography ', 3, 157),
(2, 'LIN 213', 'Introduction to Linguistics', 'Introduction to Linguistics ', 3, 158),
(2, 'ENG 214', 'Syntax', 'Syntax', 3, 159),
(2, 'ENG 215', 'Morphology', 'Morphology', 3, 160),
(2, 'GEO 221', 'World Regional Geography', 'World Regional Geography ', 3, 161),
(2, 'ENG 222', 'Introduction to Writing About Literature', 'Introduction to Writing About Literature', 2, 162),
(2, 'ENG 233', 'TEF Experience II', 'TEF Experience II ', 2, 163),
(2, 'HIS 251', 'English History to 1603', 'English History to 1603 ', 3, 164),
(2, 'HIS 252', 'English History Since 1603', 'English History Since 1603 ', 3, 165),
(2, 'HIS 292', 'Perspectives in Western Civilization', 'Perspectives in Western Civilization', 2, 166),
(2, 'SOC 351', 'World Religions', 'World Religions ', 3, 167),
(2, 'SOC 361', 'Cultural Anthropology', 'Cultural Anthropology', 3, 168),
(2, 'ENG 314', 'Advanced Syntax', 'Advanced Syntax', 3, 169),
(2, 'LIN 313', 'World Englishes', 'World Englishes', 3, 170),
(2, 'LIN 314', 'Nigerian English Varieties', 'Nigerian English Varieties', 3, 171),
(2, 'ENG 315', 'Advanced Morphology', 'Advanced Morphology', 3, 172),
(2, 'ENG 331', 'Advanced Linguistics', 'Advanced Linguistics', 3, 173),
(2, 'TES 333 ', 'Modern Grammar', 'Modern Grammar ', 3, 174),
(2, 'ENG 349', 'Technical Writing', 'Technical Writing ', 3, 175),
(2, 'ENG 371', 'Structure of the English Language', 'Structure of the English Language', 3, 176),
(2, 'ENG 372', 'Methods of TEF I', 'Methods of TEF I', 3, 177),
(2, 'ENG 411', 'Interference Phenomena in Nig Lang', 'Interference Phenomena in Nig Lang', 3, 178),
(2, 'ENG 421', 'Language Pathology', 'Language Pathology', 3, 179),
(2, 'ENG 463', 'Intercultural Communication I', 'Intercultural Communication I ', 3, 180),
(2, 'ENG 471', 'Methods of TEF II', 'Methods of TEF II ', 3, 181),
(2, 'ENG 473', 'Senior Capstone', 'Senior Capstone ', 3, 182),
(2, 'ENG 486', 'TEF Student Teaching Practicum', 'TEF Student Teaching Practicum', 3, 183),
(2, 'TES 403', 'Second Language Acquisition', 'Second Language Acquisition ', 3, 184),
(2, 'TES 405', 'Issues and Practices in TES', 'Issues and Practices in TES ', 3, 185),
(2, 'TES 499', 'Internship in TES', 'Internship in TES ', 3, 186),
(2, 'TES 500', 'Research Project', 'Research Project', 3, 187),
(4, 'AGR 122', 'Plant Production Technology', 'Plant Production Technology', 3, 188),
(4, 'AGR 240', 'Agro-ecology', 'Agro-ecology', 3, 189),
(4, 'AGR 302', 'Crop Production Science', 'Crop Production Science', 3, 190),
(4, 'AGR 306', 'Pasture Science', 'Pasture Science ', 3, 191),
(4, 'AGR 336', 'Precision Plant and Animal Management', 'Precision Plant and Animal Management ', 3, 192),
(4, 'AGR 202 ', 'Introduction to Agric Extension', 'Introduction to Agric Extension ', 3, 193),
(4, 'AGR 204', 'Introduction to Gen. Agric. (Livestock)', 'Introduction to Gen. Agric. (Livestock) ', 3, 194),
(4, 'AGR 205', 'Introduction to Crop and Forestry Botany', 'Introduction to Crop and Forestry Botany ', 3, 195),
(4, 'AGR 206', 'Introduction to General Agriculture (Crop)', 'Introduction to General Agriculture (Crop) ', 3, 196),
(4, 'AGR 209', 'Introduction to Agricultural Biochemistry', 'Introduction to Agricultural Biochemistry ', 3, 197),
(4, 'AGR 211', 'Elements of Soil Science', 'Elements of Soil Science ', 2, 198),
(4, 'AGR 212', 'Introduction to Agro-climatology', 'Introduction to Agro-climatology ', 2, 199),
(4, 'AGR 201', 'Introduction to Computer Science', 'Introduction to Computer Science ', 2, 200),
(4, 'ANM 114', 'Animal Welfare, Behaviour & Handling', 'Animal Welfare, Behaviour & Handling ', 3, 201),
(4, 'ANM 244', 'Intensive Animal Production', 'Intensive Animal Production ', 3, 202),
(4, 'ANM 251', 'Animal Anatomy & Physiology 1', 'Animal Anatomy & Physiology 1 ', 3, 203),
(4, 'ANM 253', 'Animal Nutrition', 'Animal Nutrition ', 3, 204),
(4, 'ANM 254', 'Grazing Animal Production', 'Grazing Animal Production ', 3, 205),
(4, 'WEM 311', 'Wildlife Ecology, Population Analysis and Management (AGRIC2019)', 'Wildlife Ecology, Population Analysis and Management (AGRIC2019)', 2, 206),
(4, 'WEM 313', 'Principles of Conservation in Tropical Area', 'Principles of Conservation in Tropical Area ', 2, 207),
(4, 'AGR 315', 'Forest Economics', 'Forest Economics ', 2, 208),
(4, 'AGR 320', 'Forest Biometrics I', 'Forest Biometrics I ', 3, 209),
(4, 'AGR 313', 'Introduction to Agric. Extension and Rural Sociology', 'Introduction to Agric. Extension and Rural Sociology ', 2, 210),
(4, 'AGR 314', 'Field Work', 'Field Work', 3, 211),
(4, 'ANM 406', 'Animal Health and Epidemiology', 'Animal Health and Epidemiology ', 3, 212),
(4, 'ANM 445', 'Livestock Science & Production', 'Livestock Science & Production', 3, 213),
(4, 'HOR 207', 'Horticultural Science', 'Horticultural Science ', 3, 214),
(4, 'HOR 303', 'Production Horticulture', 'Production Horticulture ', 3, 215),
(4, 'PLT 202', 'Plant Physiology', 'Plant Physiology ', 3, 216),
(4, 'LAN 203', 'The Soil Environment', 'The Soil Environment ', 3, 217),
(4, 'ANM 499', 'Field Work', 'Field Work', 3, 218),
(4, 'LAN 305', 'Soil Plant Relationships', 'Soil Plant Relationships ', 3, 219),
(4, 'PLT 211', 'Plant and Environmental Health', 'Plant and Environmental Health ', 3, 220),
(4, 'CHM 501', 'Chemistry', 'Chemistry', 3, 221),
(4, 'CHM 502', 'Organic Chemistry', 'Organic Chemistry', 3, 222),
(4, 'CHM 503', 'Inorganic Chemistry', 'Inorganic Chemistry', 3, 223),
(4, 'CHM 504', 'Physical Chemistry', 'Physical Chemistry', 3, 224),
(4, 'ANM 599', 'Research Project', 'Research Project', 6, 225),
(2, 'COM 101_2', 'Principles of Oral Communication', 'Principles of Oral Communication. ', 2, 226),
(2, 'COM 102', 'Introduction to Communication Studies', 'Introduction to Communication Studies. ', 2, 227),
(2, 'COM 103', 'Production of Multimedia Software', 'Production of Multimedia Software. ', 2, 228),
(2, 'COM 104', 'Workshops and or Seminars', 'Workshops and or Seminars', 2, 229),
(2, 'COM 105', 'Origin of Language', 'Origin of Language. ', 3, 230),
(2, 'COM 106', 'Seminar', 'Seminar ', 2, 231),
(2, 'COM 201', 'Analysis and Briefing', 'Analysis and Briefing', 2, 232),
(2, 'COM 202_2', 'Principles of Argumentation', 'Principles of Argumentation.  ', 2, 233),
(2, 'COM 203', 'Forensics I', 'Forensics I.  ', 2, 234),
(2, 'COM 204_2', 'Forensics II', 'Forensics II. ', 2, 235),
(2, 'COM 205_2', 'Theories of Persuasion', 'Theories of Persuasion. ', 2, 236),
(2, 'COM 206', 'Freedom of Communication', 'Freedom of Communication. ', 2, 237),
(2, 'COM 207', 'Terrorism in Journalism', 'Terrorism in Journalism. ', 2, 238),
(2, 'COM 208', 'Communication Theory', 'Communication Theory. ', 2, 239),
(2, 'COM 209', 'Entrepreneurial Communication', 'Entrepreneurial Communication. ', 2, 240),
(2, 'COM 210_3', 'Gender and Communication', 'Gender and Communication. ', 2, 241),
(2, 'COM 211_2', 'Conflict and Communication', 'Conflict and Communication.', 2, 242),
(2, 'COM 212_2', 'Current Problems in Evolution and Communication', 'Current Problems in Evolution and Communication. ', 2, 243),
(2, 'COM 213_2', 'Nonverbal Communication and Body Language', 'Nonverbal Communication and Body Language.  ', 2, 244),
(2, 'COM 214_2', 'Understanding Relationships', 'Understanding Relationships.  ', 2, 245),
(2, 'COM 216', 'Communication and Conflict in Couples and Families', 'Communication and Conflict in Couples and Families. ', 2, 246),
(2, 'COM 217', 'Negotiation', 'Negotiation. ', 2, 247),
(2, 'COM 218', 'Language and Music', 'Language and Music.  ', 2, 248),
(2, 'COM 219', 'Voice & Its Perception', 'Voice & Its Perception. ', 2, 249),
(2, 'COM 219', 'Voice & Its Perception. ', 'Voice & Its Perception. ', 2, 249),
(2, 'COM 230', 'Group Communication', 'Group Communication.  ', 2, 250),
(2, 'COM 220', 'Theories of Argumentation', 'Theories of Argumentation ', 2, 251),
(2, 'COM 221', 'Speech Writing Theory and Practice', 'Speech Writing Theory and Practice ', 2, 151),
(2, 'COM 223', 'Talk and the Body', 'Talk and the Body. ', 2, 252),
(2, 'COM 224', 'Communication and Culture', 'Communication and Culture  ', 2, 253),
(2, 'COM 227', 'Communication and Technology', 'Communication and Technology ', 2, 153),
(2, 'COM 229', 'Communication Technology, Community, and Personal Identity ', 'Communication Technology, Community, and Personal Identity ', 2, 154),
(2, 'COM 234', 'Reporting', 'Reporting', 2, 254),
(2, 'COM 238', 'Theories of Relational Communication', 'Theories of Relational Communication ', 2, 255),
(2, 'COM 215', 'Principles of Rhetorical Criticism', 'Principles of Rhetorical Criticism ', 2, 149),
(2, 'COM 225_2', 'Talk and Social Institutions.', 'Talk and Social Institutions.  ', 2, 256),
(2, 'COM 226', 'Evolution of Interpersonal Communication', 'Evolution of Interpersonal Communication. ', 2, 257),
(2, 'COM 227', 'Animal Communication', 'Animal Communication. ', 2, 258),
(2, 'COM 228', 'Play and Entertainment', 'Play and Entertainment. ', 2, 259),
(2, 'COM 231', 'The Gaming Mind', 'The Gaming Mind. ', 2, 260),
(2, 'COM 232_2', 'Multicultural Television', 'Multicultural Television. ', 2, 261),
(2, 'COM 233', 'Decoding Media Strategies. ', 'Decoding Media Strategies. ', 2, 262),
(2, 'COM 237', 'Transnational Bollywood and Nollywood', 'Transnational Bollywood and Nollywood. ', 2, 263),
(2, 'COM 240', 'Theory of Persuasive Communication', 'Theory of Persuasive Communication. ', 2, 264),
(2, 'COM 241', 'Films of Persuasion: Social and Political Advocacy in Mass Society', 'Films of Persuasion: Social and Political Advocacy in Mass Society.  ', 2, 265),
(2, 'COM 243', 'Rhetoric of Popular Culture', 'Rhetoric of Popular Culture.   ', 2, 266),
(2, 'COM 244', 'Conversational Structures', 'Conversational Structures. ', 2, 267),
(2, 'COM 245', 'Situation Comedy and African, American and European Culture', 'Situation Comedy and African, American and European Culture. ', 2, 268),
(2, 'COM 246', 'Evolution of Mass Media Images', 'Evolution of Mass Media Images. ', 2, 269),
(2, 'COM 247', 'Sociology of Mass Communication. ', 'Sociology of Mass Communication. ', 2, 270),
(2, 'COM 248', 'Marketing, Advertising and Human Nature', 'Marketing, Advertising and Human Nature.  ', 2, 271),
(2, 'COM 249', 'Media: Gender, Race, Class & Sexuality. ', 'Media: Gender, Race, Class & Sexuality. ', 2, 272),
(2, 'COM 251', 'Computer-Mediated Communication', 'Computer-Mediated Communication', 2, 273),
(2, 'COM 252', 'Analysis of Communication Effects', 'Analysis of Communication Effects. ', 2, 274),
(2, 'COM 253', 'The Media and Aggression Against Women', 'The Media and Aggression Against Women. ', 2, 275),
(2, 'COM 254', 'Social Communication and the New Technology', 'Social Communication and the New Technology. ', 2, 276),
(2, 'COM 256', 'Social Networking', 'Social Networking.  ', 2, 277),
(2, 'COM 257', 'Celebrity, Fame, and Social Media', 'Celebrity, Fame, and Social Media. ', 2, 278),
(2, 'COM 258', 'Revolutions in Communication Technology', 'Revolutions in Communication Technology. ', 2, 279),
(2, 'COM 259', 'Pornography and Evolution', 'Pornography and Evolution. ', 2, 280),
(2, 'COM 262', 'Student Research Program', 'Student Research Program. ', 2, 281),
(2, 'COM 298', 'Undergraduate Seminar', 'Undergraduate Seminar ', 2, 282),
(2, 'COM 299', 'Methodologies in Communication Research', 'Methodologies in Communication Research.  ', 2, 283),
(2, 'COM 302', 'Law of the Creative Process', 'Law of the Creative Process. ', 2, 284),
(2, 'COM 310', 'Current Issues in Privacy', 'Current Issues in Privacy  ', 2, 285),
(2, 'COM 317', 'Voice, Violence, and Democracy', 'Voice, Violence, and Democracy. ', 2, 286),
(2, 'COM 320', 'Political Communication', 'Political Communication. ', 2, 287),
(2, 'COM 321', 'Media and Publics across Cultures.  ', 'Media and Publics across Cultures.  ', 2, 288),
(2, 'COM 322', 'Comparison of Rhetoric between African and American Presidents', 'Comparison of Rhetoric between African and American Presidents. ', 2, 289),
(2, 'COM 326', 'African American Rhetoric', 'African American Rhetoric. ', 2, 290),
(2, 'COM 330', 'Contemporary Problems in Freedom of Speech. ', 'Contemporary Problems in Freedom of Speech. ', 2, 291),
(2, 'COM 334', 'Media and the Making of Social Class', 'Media and the Making of Social Class. ', 2, 292),
(2, 'COM 335', 'Philosophy of Language and Communication', 'Philosophy of Language and Communication. ', 2, 293),
(2, 'COM 340', 'Community Integration of Labelled People', 'Community Integration of Labelled People. ', 2, 294),
(2, 'COM 341', 'Communication and Aging', 'Communication and Aging.  ', 2, 295),
(2, 'COM 344', 'Interpersonal Conflict', 'Interpersonal Conflict. ', 2, 296),
(2, 'COM 345', 'Family Communication', 'Family Communication. ', 2, 297),
(2, 'COM 351', 'Technology and Human Interaction', 'Technology and Human Interaction. ', 2, 298),
(2, 'COM 352', 'Social Network', 'Social Network.  ', 2, 299),
(2, 'COM 353', 'Collaboration Technology', 'Collaboration Technology. ', 2, 300),
(2, 'COM 360', 'Theories of Organizational Communication', 'Theories of Organizational Communication. ', 2, 301),
(2, 'COM 361', 'Electoral Politics: Mass Media and Elections', 'Electoral Politics: Mass Media and Elections. ', 2, 302),
(2, 'COM 362', 'Presidential Communication', 'Presidential Communication.  ', 2, 303),
(2, 'COM 363', 'Public Diplomacy: Communicating U.S. Ideas to Foreign Citizenry', 'Public Diplomacy: Communicating U.S. Ideas to Foreign Citizenry. ', 2, 304),
(2, 'COM 364', 'Entertainment Law', 'Entertainment Law. ', 2, 305),
(2, 'COM 365', 'Agitational Communication', 'Agitational Communication ', 2, 306),
(2, 'COM 366', 'Communicative Dynamics in Film and TV Production', 'Communicative Dynamics in Film and TV Production. ', 2, 307),
(2, 'COM 367', 'Sex, Politics, and Race: Free Speech on Campus', 'Sex, Politics, and Race: Free Speech on Campus.', 2, 308),
(2, 'COM 368', 'Free Speech in Advertising', 'Free Speech in Advertising. ', 2, 309),
(2, 'COM 369', 'Critical Vision: History of Art as Social and Political Commentary', 'Critical Vision: History of Art as Social and Political Commentary.  ', 2, 310),
(2, 'COM 370', 'Legal Communication', 'Legal Communication. ', 2, 311),
(2, 'COM 371', 'Theories of Freedom of Speech and Press', 'Theories of Freedom of Speech and Press.  ', 2, 312),
(2, 'COM 372', 'Free Speech in Workplace', 'Free Speech in Workplace. ', 2, 313),
(2, 'COM 378', 'Online Communities and Crowds: Organization, Innovation, and Mobilization', 'Online Communities and Crowds: Organization, Innovation, and Mobilization. ', 2, 314),
(2, 'COM 386', 'Science, Technology, and Society', 'Science, Technology, and Society.', 2, 315),
(2, 'COM 187', 'Ethical and Policy Issues in Institutions of Mass Communication', 'Ethical and Policy Issues in Institutions of Mass Communication. ', 2, 316),
(2, 'COM 444', 'Communication Studies', 'Communication Studies:  ', 6, 317),
(2, 'COM 475', 'Criticism and the Public Arts', 'Criticism and the Public Arts. ', 2, 318),
(2, 'COM 476', 'Visual Communication and Social Advocacy', 'Visual Communication and Social Advocacy. ', 2, 319),
(2, 'COM 478', 'Propaganda & the Media', 'Propaganda & the Media. ', 2, 320),
(2, 'COM 479', 'Images of the Africa', 'Images of the Africa. ', 2, 321),
(2, 'COM 482', 'Non Verbal Communication in Architecture', 'Non Verbal Communication in Architecture. ', 3, 322),
(2, 'COM 483', 'Media and the Mind', 'Media and the Mind. ', 2, 323),
(2, 'COM 484', 'Abortion, Death Penalty, and Gun Control: Arguing Contemporary Social Issues', 'Abortion, Death Penalty, and Gun Control: Arguing Contemporary Social Issues. ', 2, 324),
(2, 'COM 485', 'Field Studies in Communication', 'Field Studies in Communication  ', 2, 325),

(3, 'ECO 201', 'Introductory Economics', 'Introductory Economics', 3, 469),
(3, 'ECO 202', 'Introductory Economics II', 'Introductory Economics II', 3, 468),
(3, 'ECO 203', 'The Nigerian Economy in Perspective', 'The Nigerian Economy in Perspective',3, 467),
(3, 'ECO 204', 'Introductory Mathematics for Economics', 'Introductory Mathematics for Economics', 3, 466),
(3, 'ECO 205', 'Principle of Economics I', 'Principle of Economics I', 3, 465),
(3, 'ECO 206', 'Principle of Economics II', 'Principle of Economics II', 3, 464),
(3, 'ECO 207', 'Applied Economics', 'Applied Economics', 3, 463),
(3, 'ECO 208', 'Introductory Mathematics for Economists II', 'Introductory Mathematics for Economists II', 3, 462),
(3, 'ECO 301', 'Micro-Economics Theory', 'Micro-Economics Theory', 3, 461),
(3, 'ECO 302', 'Macro-Economic Theory', 'Macro-Economic Theory ', 3, 460),
(3, 'ECO 303', 'Structure of the Nigerian Economy', 'Structure of the Nigerian Economy', 3, 459),
(3, 'ECO 305', 'Project Analysis I', 'Project Analysis I', 3, 458),
(3, 'ECO 311', 'Introduction to Accounting', 'Introduction to Accounting', 3, 457),
(3, 'ECO 312', 'Principle of Accounting', 'Principle of Accounting', 3, 456),
(3, 'ECO 314', 'Economics of Marketing', 'Economics of Marketing', 3, 455),
(3, 'ECO 315', 'Business Finance', 'Business Finance', 3, 454),
(3, 'ECO 321', 'Economic Development Theory', 'Economic Development Theory', 3, 453),
(3, 'ECO 341', 'Mathematics for Economists', 'Mathematics for Economists', 3, 452),
(3, 'ECO 361', 'Monetary and Financial Institutions', 'Monetary and Financial Institutions', 3, 448),
(3, 'ECO 362', 'Monetary Theory', 'Monetary Theory', 3, 447),
(3, 'ECO 371', 'Elements of Public Finance', 'Elements of Public Finance', 3, 446),
(3, 'ECO 401', 'Introduction to Econometric II', 'Introduction to Econometric II', 3, 445),
(3, 'ECO 402', 'Introduction to International Economics', 'Introduction to International Economics', 3, 444),
(3, 'ECO 403', 'Monetary and Financial Institutions', 'Monetary and Financial Institutions', 3, 443),
(3, 'ECO 404', 'Monetary Theory', 'Monetary Theory', 3, 442),
(3, 'ECO 405', 'Element of Public Finance', 'Element of Public Finance', 3, 441),
(3, 'ECO 406', 'Micro-Economics', 'Micro-Economics', 3, 440),
(3, 'ECO 407', 'Macro-Economics', 'Macro-Economics', 3, 439),
(3, 'ECO 408', 'Project Analysis II', 'Project Analysis II', 4, 438),
(3, 'ECO 409', 'Management Accounting', 'Management Accounting', 3, 437),
(3, 'ECO 410', 'Principles of Auditing', 'Principles of Auditing', 3, 436),
(3, 'ECO 411', 'Management Accounting', 'Management Accounting', 3, 435),
(3, 'ECO 501', 'Theory of International Trade', 'Theory of International Trade', 3, 434),
(3, 'ECO 502', 'International Finance', 'International Finance', 3, 433),
(3, 'ECO 503', 'Monetary Theory and Policies', 'Monetary Theory and Policies', 3, 432),
(3, 'ECO 504', 'Policy Sector Economics','Policy Sector Economics', 3, 431),
(3, 'ECO 505', 'Economic of Human Resources', 'Economic of Human Resources', 3, 430),
(3, 'ECO 506', 'Introductory Econometrics II (Applied)', 'Introductory Econometrics II (Applied)', 3, 429),
(3, 'ECO 507', 'Original Essay', 'Original Essay', 6, 428),
(3, 'ECO 508', 'History of Economic Thought', 'History of Economic Thought', 3, 427),
(3, 'ECO 599', 'PROJECT', 'PROJECT', 6, 426),
(1, 'PROJECT ', 'PROJECT ', 'PROJECT ', 6, 359),
(5, 'BMS 201', 'Essentials of Management', 'Essentials of Management', 3, 360),
(5, 'BMS 202', 'Academic and Professional Studies', 'Academic and Professional Studies', 3, 361),
(5, 'BMK 203', 'Principles of Marketing', 'Principles of Marketing', 3, 362),
(5, 'BMF 204', 'Accounting and Finance', 'Accounting and Finance', 3, 363),
(5, 'BMS 205', 'International Business Environment', 'International Business Environment', 3, 364),
(5, 'BMS 206', 'Managing and Leading People', 'Managing and Leading People', 3, 365),
(5, 'BMF 301', 'Customer Behaviour or Personal Finance', 'Customer Behaviour or Personal Finance', 3, 366),
(5, 'BMS 302', 'Leading Change', 'Leading Change', 3, 367),
(5, 'BMS 303', 'Corporate Responsibility', 'Corporate Responsibility', 3, 368),
(5, 'BMS 304', 'Third Sector Experience', 'Third Sector Experience', 3, 369),
(5, 'BMS 305', 'Personal and Professional Development', 'Personal and Professional Development', 3, 370),
(5, 'BMS 306', 'Information and Resource Management', 'Information and Resource Management', 3, 371),
(5, 'BMS 401', 'Sector Internship or equivalent', 'Sector Internship or equivalent', 3, 372),
(5, 'BMS 402', 'Sector Specific Project', 'Sector Specific Project', 3, 373),
(5, 'BMS 403', 'Effective Managerial Decision Making', 'Effective Managerial Decision Making', 3, 374),
(5, 'BMS 404', 'Strategic Management', 'Strategic Management', 3, 375)



;


-- ddl-end --

-- object: public.departments | type: TABLE --
-- DROP TABLE IF EXISTS public.departments CASCADE;
CREATE TABLE public.departments(
	id bigserial NOT NULL,
	faculty_id smallint NOT NULL,
	name varchar(50) NOT NULL,
	code varchar(10) NOT NULL,
	CONSTRAINT pk_department_id PRIMARY KEY (id),
	CONSTRAINT uq_department_code UNIQUE (code)

);
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.departments (id,faculty_id,name,code) VALUES 
(0, 0,'None','000');


INSERT INTO public.departments (faculty_id,name,code) VALUES 
(1, 'Film and Media Arts', 'FMA'),
(1, 'English Language and Communication', 'ELC'),
(3, 'Economics', 'ECO'),
(4, 'Applied Agricultural Sciences', 'AAS'),
(2, 'Business Management Sciences', 'BMS');



-- ddl-end --

-- object: public.faculties | type: TABLE --
-- DROP TABLE IF EXISTS public.faculties CASCADE;
CREATE TABLE public.faculties(
	id serial NOT NULL,
	name varchar(50) NOT NULL,
	code varchar(10) NOT NULL,
	faculty_desc text NOT NULL,
	CONSTRAINT pk_faculty_id PRIMARY KEY (id),
	CONSTRAINT uq_faculty_code UNIQUE (code)

);
-- ddl-end --

-- Appended SQL commands --

INSERT INTO public.faculties (id,name,code,faculty_desc)  VALUES 
(0,'None','OOO', 'Empty faculty');

INSERT INTO public.faculties (name,code, faculty_desc) VALUES 
('Faculty of Cultural Studies', 'FCS', 'Faculty of Cultural Studies'),
('Faculty of Business Studies', 'FBS', 'Faculty of Business Studies'),
('Faculty of Social Sciences', 'FSS', 'Faculty of social sciences'),
('Faculty of Applied Agricultural Sciences', 'FAAS', 'Faculty of Applied Agricultural Sciences');
-- ddl-end --

-- object: public.applicants | type: TABLE --
-- DROP TABLE IF EXISTS public.applicants CASCADE;
CREATE TABLE public.applicants(
	id serial NOT NULL,
	program_type_id bigint NOT NULL,
	session_id bigint NOT NULL,
	application_no varchar(20) NOT NULL,
	step smallint NOT NULL DEFAULT 0,
	sittings_count smallint NOT NULL DEFAULT 1,
	verification_code varchar NOT NULL,
	entry_mode smallint NOT NULL,
	payment_status smallint NOT NULL DEFAULT 0,
	application_status integer NOT NULL DEFAULT 1,
	is_verified bool NOT NULL DEFAULT false,
	resend bool NOT NULL DEFAULT false,
	source integer NOT NULL,
	email_address varchar(45) NOT NULL,
	CONSTRAINT pk_applicant_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.applicants.application_no IS 'To contain admission id if admission has been offered to candidate';
-- ddl-end --
COMMENT ON COLUMN public.applicants.entry_mode IS '0 to mean not submitted, 1 to mean its submitted';
-- ddl-end --
COMMENT ON COLUMN public.applicants.payment_status IS '0  mean payment not paid, 1  mean paid';
-- ddl-end --
COMMENT ON COLUMN public.applicants.application_status IS '1 - inprogress, 2 - pending(pending payment), 3 - completed, 4 - verified, 5- declined, 6 - approved (made acceptance payment)';
-- ddl-end --
COMMENT ON COLUMN public.applicants.is_verified IS 'is either "false" or "true"';
-- ddl-end --
COMMENT ON COLUMN public.applicants.resend IS 'is either "false" or "true"';
-- ddl-end --
COMMENT ON COLUMN public.applicants.source IS 'To give information regarding the source from which applicant was created';
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.applicants (id,program_type_id,session_id,application_no,step,sittings_count,verification_code,entry_mode,payment_status,application_status,is_verified,resend,source,email_address) VALUES 
(0,0,0,'None',0,0,0,0,0,0,false,false,0,'None');

INSERT INTO public.applicants (id,program_type_id,session_id,application_no,step,sittings_count,verification_code,entry_mode,payment_status,application_status,is_verified,resend,source,email_address) VALUES 
(2,1,1,'WMUO-A-618081597',4,1,12345,1,1,6,true,false,1, 'javalised@yahoo.com'),
(3,1,1,'WMUO-A-718081597',4,1,12345,1,1,6,true,false,1, 'benita_ola@mailinator.com'),

(4,3,2,'WMUO-A-818081597',4,1,12346,1,1,6,true,false, 1, 'konisarotu@yahoo.com'),
(5,3,2,'WMUO-A-918081597',4,1,12346,1,1,6,true,false, 1,'james_chris@mailinator.com'),

(6,1,3,'WMUO-A-1018081597',4,1,12347,1,1,3,true,false, 1, 'ehiojee@mailinator.com')
;

-- ddl-end --

-- object: public.applicant_exams | type: TABLE --
-- DROP TABLE IF EXISTS public.applicant_exams CASCADE;
CREATE TABLE public.applicant_exams(
	id bigserial NOT NULL,
	applicant_id bigint NOT NULL,
	exam_type smallint NOT NULL,
	year integer NOT NULL,
	exam_no varchar(25) NOT NULL,
	CONSTRAINT pk_applicant_exam_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.applicant_exams.exam_type IS '1 - NECO, 2 - WAEC, 3 - Alevels, 3 - SAT';
-- ddl-end --
COMMENT ON COLUMN public.applicant_exams.exam_no IS 'The student examination number for the exam';
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.applicant_exams (applicant_id,exam_type,year,exam_no) 
VALUES 
(2,1,2008,'abc1146cg'),
(3,1,2009,'cdf1256mg'),
(4,2,2010,'efg2196ng'),
(5,2,2010,'efg3006ng'),
(6,2,2010,'efg4446ng')




;
-- ddl-end --


CREATE TABLE public.applicant_diplomas(
	id bigserial NOT NULL,
	applicant_id bigint NOT NULL,
	matric_no varchar(15) NOT NULL,
	course_study text NOT NULL,
	institution_name text NOT NULL,
	graduation_year integer NOT NULL,
	entry_year integer NOT NULL,
	CONSTRAINT pk_applicant_diploma_id PRIMARY KEY (id)
);



-- object: public.programs | type: TABLE --
-- DROP TABLE IF EXISTS public.programs CASCADE;
CREATE TABLE public.programs(
	id bigserial NOT NULL,
	dept_id bigint NOT NULL,
	name varchar(100) NOT NULL,
	sub_title varchar(100) NOT NULL,
	content text NOT NULL,
	description text NOT NULL,
	session_count smallint NOT NULL,
	required_unit smallint NOT NULL,
	min_unit smallint NOT NULL,
	max_unit smallint NOT NULL,
	type smallint NOT NULL,
	CONSTRAINT pk_programs_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.programs.session_count IS 'The duration is in sessions count for the respective program';
-- ddl-end --
COMMENT ON COLUMN public.programs.min_unit IS 'refers to the minimum units required for the semester';
-- ddl-end --
COMMENT ON COLUMN public.programs.max_unit IS 'refers to the maximum units required for each semester';
-- ddl-end --
COMMENT ON COLUMN public.programs.type IS 'The type is the category of degree, whether it''s first degree, masters degree, doctorate degree, or professorship';
-- ddl-end --

-- Appended SQL commands --

INSERT INTO public.programs 
(id,dept_id,name,sub_title,description,content,session_count,required_unit,min_unit,max_unit,type) VALUES 
(0,0, 'None','None','None','None',0,0, 0, 0,0);

INSERT INTO public.programs 
(dept_id,name,sub_title,description,content,session_count,required_unit,min_unit,max_unit,type) VALUES 
(5, 'Business Management (B.Sc.)','First Degree Business Management','This is a first year degree course for students interested in Business Management. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.',
'This is a first year degree course for students interested in Business Management. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in Accounting and financial management. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers. This is a first year degree course for students interested in Accounting and financial management. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in Accounting and financial management. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.',4,144, 9, 25,1), 

(2, 'English/Teaching English (B.A.)','First Degree English/Teaching English as a Foreign Language','This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.',
'This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers. This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.',4,144, 9,25,1),

(3, 'Economics (B.Sc.)','First Degree Economics','This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.',
'This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers. This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.',4,144, 9,25,1),

(4, 'African Culture and Civilization (B.A.)' ,'First Degree African Culture and Civilization','This is a first year degree course for students interested in Arts. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.',
'This is a first year degree course for students interested in Arts. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in Arts. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers. This is a first year degree course for students interested in Arts. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in Arts. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.',4,144, 9,25,1);



CREATE TABLE public.programmes(
	id bigserial NOT NULL,
	program_id bigint NOT NULL,
	title varchar(100) NOT NULL,
	sub_title varchar(100) NOT NULL,
	content text NOT NULL,
	description text NOT NULL,
	CONSTRAINT pk_programme_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.programmes.title IS 'The main title of the programme';
-- ddl-end --
COMMENT ON COLUMN public.programmes.sub_title IS 'refers to the sub-title of the programme at present';
-- ddl-end --
COMMENT ON COLUMN public.programmes.content IS 'refers to the content description for this programme';
-- ddl-end --

-- Appended SQL commands --

INSERT INTO public.programmes 
(program_id,title,sub_title,description,content) VALUES 
(1,'ACCOUNTING (Bsc)',
'First Degree Accounting','This is a first year degree course for students interested in Accounting and financial management. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.',
'This is a first year degree course for students interested in Accounting and financial management. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in Accounting and financial management. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers. This is a first year degree course for students interested in Accounting and financial management. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in Accounting and financial management. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.'),

(2,'APPLIED ECONOMICS (Bsc)','First Degree Applied Economics','This is a first year degree course for students interested in Applied Economics. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.',
'This is a first year degree course for students interested in Applied Economics. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in Applied Economics. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers. This is a first year degree course for students interested in Applied Economics. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in Applied Economics. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.'),

(3,'ENGLISH (Bsc)','First Degree English','This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.',
'This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers. This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in English. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.'),

(4,'ART (Bsc)','First Degree Art','This is a first year degree course for students interested in Arts. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.',
'This is a first year degree course for students interested in Arts. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in Arts. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers. This is a first year degree course for students interested in Arts. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.This is a first year degree course for students interested in Arts. A lot of exposure exists for students interested in this interesting course with the state of the art infrastructure and environment to meet the global demand of any student interested in this course. For any of the programme we offer, we lay a very good foundation for interested student to enable them flourish in their various academic endeavours and careers.');


CREATE TABLE public.contact_forms(
	id bigserial NOT NULL,
	email_address varchar(100) NOT NULL,
	full_name varchar(100) NOT NULL,
	message text NOT NULL,
	CONSTRAINT pk_contact_form_is PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON COLUMN public.contact_forms.full_name IS 'The firstname,surname and middlename all combined as one.';


-- ddl-end --

-- object: public.states | type: TABLE --
-- DROP TABLE IF EXISTS public.states CASCADE;
CREATE TABLE public.states(
	id bigserial NOT NULL,
	name varchar(50) NOT NULL,
	CONSTRAINT pk_state_id PRIMARY KEY (id)

);
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.states (id, name) VALUES 
(0, 'none');

INSERT INTO public.states (name) VALUES 
('Abia State'), ('Adamawa State'), ('Akwa Ibom State'), 
('Anambra State'), ('Bauchi State'), ('Bayelsa State'), 
('Benue State'), ('Borno State'), ('Cross River State'), 
('Delta State'), ('Ebonyi State'), ('Edo State'), 
('Ekiti State'), ('Enugu State'), ('FCT'), 
('Gombe State'), ('Imo State'), ('Jigawa State'), 
('Kaduna State'), ('Kano State'), ('Katsina State'), 
('Kebbi State'), ('Kogi State'), ('Kwara State'), 
('Lagos State'), ('Nasarawa State'), ('Niger State'), 
('Ogun State'), ('Ondo State'), ('Osun State'), 
('Oyo State'), ('Plateau State'), ('Rivers State'), 
('Sokoto State'), ('Taraba State'), ('Yobe State'), 
('Zamfara State');

-- ddl-end --

-- object: public.admissions | type: TABLE --
-- DROP TABLE IF EXISTS public.admissions CASCADE;
CREATE TABLE public.admissions(
	id int8 NOT NULL,
	applicant_id bigint NOT NULL,
	payment_status bool DEFAULT false,
	payment_date date,
	CONSTRAINT pk_admission_id PRIMARY KEY (id)

);
-- ddl-end --

-- object: public.persons | type: TABLE --
-- DROP TABLE IF EXISTS public.persons CASCADE;
CREATE TABLE public.persons(
	id bigserial NOT NULL,
	person_type integer NOT NULL DEFAULT 0,
	surname varchar(30) NOT NULL,
	first_name varchar(30) NOT NULL,
	other_name varchar(30) NOT NULL,
	mobile_no varchar(15) NOT NULL,
	email_address varchar(45) NOT NULL,
	dob date NOT NULL,
	nationality_id bigint NOT NULL,
	religion_id integer NOT NULL,
	gender smallint NOT NULL,
	marital_status smallint NOT NULL,
	address varchar(90) NOT NULL,
	state_id bigint NOT NULL,
	lga_id bigint NOT NULL,
	disability bool NOT NULL,
	disability_description varchar(100) NOT NULL DEFAULT ' ',
	date timestamp NOT NULL DEFAULT LOCALTIMESTAMP,
	CONSTRAINT pk_person_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.persons.person_type IS '0 - applicant/student, 1- staff/admin';
-- ddl-end --
COMMENT ON COLUMN public.persons.gender IS '1 - male, 2 - female';
-- ddl-end --
COMMENT ON COLUMN public.persons.marital_status IS '0 - single, 1 married, 2 - divorced, 3 - widowed';
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.persons 
(person_type,surname,first_name,other_name,mobile_no,email_address,dob,nationality_id,religion_id,gender,marital_status,address,state_id,lga_id,disability) 
VALUES
(1,'Great','Dark','Hacker','08056478363', 'henry.erabor@orbsolutions.com.ng', '1970-07-12', 130, 1, 1, 1, '10 babyface close, allen avenue, ikeja',12, 218, false),
(0,'Aguele','Collins','Dennis','07012576849', 'javalised@yahoo.com', '1980-10-12', 130, 1, 1, 1, '10 ajasco close, oba akran, ikeja',12, 218, false),
(0,'Benita','Olaolu','Adeola','08102044584', 'benita_ola@mailinator.com', '1984-10-12', 130, 1, 2, 1, '76 aliyu close, oba akran, ikeja',12, 218, false),
(0,'Kazeem','Onisarotu','Kazman','0807456349', 'konisarotu@yahoo.com', '1994-07-12', 130, 1, 1, 1, '170 westgate close, oba akran, ikeja',1, 13, false),
(0,'James','Gunn','Chris','0807466649', 'james_chris@mailinator.com', '1994-10-12', 130, 1, 1, 1, '10 westgate close, oba akran, ikeja',1, 13, false),
(0,'Opeyemi','Olumipo','Popstar','0906574975', ' ', '1990-07-12', 130, 1, 1, 1, '190 waterloo close, allen avenue, ikeja',13, 234, false),
(1,'Bold','White','Hacker','08012378363', 'ope.popoola@orbsolutions.com.ng', '1977-08-12', 130, 1, 1, 1, '18 babyface close, allen avenue, ikeja',12, 218, false),
(1,'Promise','Brown','Hacker','08056478444', 'promise.akai@orbsolutions.com.ng', '1970-07-12', 130, 1, 1, 1, '30 babyface close, allen avenue, ikeja',12, 218, false),
(1,'Courage','Groot','Hacker','08056478363', 'kazeem.konisarotu@orbsolutions.com.ng', '1970-07-12', 130, 1, 1, 1, '10 babyface close, allen avenue, ikeja',12, 218, false),
(1,'Staff','Lecturer','Bond','08044478389', 'oladipupo.ajayi@orbsolutions.com.ng', '1980-07-12', 130, 1, 1, 1, '20 babyface close, allen avenue, ikeja',12, 218, false)
;
-- ddl-end --

CREATE TABLE public.secrets(
	person_id bigint NOT NULL,
	password varchar(150) NOT NULL,
	CONSTRAINT pk_password_table_person_id UNIQUE (person_id)
);

-- Appended SQL commands --
INSERT INTO public.secrets(person_id, password) VALUES
(2, 'secret'),
(3, 'secret'),
(4, 'secret'),
(5, 'secret');

-- object: public.subjects | type: TABLE --
-- DROP TABLE IF EXISTS public.subjects CASCADE;
CREATE TABLE public.subjects(
	id serial NOT NULL,
	subject varchar(50) NOT NULL,
	CONSTRAINT pk_subject_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.subjects IS 'Table is a collection of subjects from represented by various id';
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.subjects (id, subject) VALUES 
(0, 'none');

INSERT INTO public.subjects (subject) VALUES 
('Agricultural Science'),
('Biology'),
('Chemistry'),
('Economics'),
('English Language'),
('Further-Mathematics'),
('Geography'),
('Agricultural Science'),
('Mathematics'),
('Physics'),
('Yoruba');
-- ddl-end --

-- object: public.applicant_exam_results | type: TABLE --
-- DROP TABLE IF EXISTS public.applicant_exam_results CASCADE;
CREATE TABLE public.applicant_exam_results(
	id bigserial NOT NULL,
	applicant_exam_id bigint NOT NULL,
	subject_id integer NOT NULL,
	grade varchar(2) NOT NULL,
	CONSTRAINT pk_result_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.applicant_exam_results.applicant_exam_id IS 'Column is to hold id that contains information of the year, and type of exam for a each subject inputted by the applicant for reference purpose';
-- ddl-end --
COMMENT ON COLUMN public.applicant_exam_results.subject_id IS 'This foreign key is used to represent each subject which comes from another table';
-- ddl-end --
COMMENT ON COLUMN public.applicant_exam_results.grade IS 'Grade is used to represent scores obtained for each subject';
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.applicant_exam_results (applicant_exam_id,subject_id,grade) 
VALUES 
(1,5,'A'),
(1,3,'B'),
(1,8,'C'),
(1,9,'A'),
(1,10,'A'),

(2,5,'C'),
(2,3,'A'),
(2,8,'B'),
(2,9,'A'),
(2,10,'A'),

(3,5,'B'),
(3,3,'B'),
(3,8,'A'),
(3,9,'C'),
(3,10,'C'),

(4,5,'C'),
(4,3,'A'),
(4,8,'B'),
(4,9,'A'),
(4,10,'A'),

(5,5,'A'),
(5,3,'B'),
(5,8,'C'),
(5,9,'A'),
(5,10,'A')


;
-- ddl-end --

-- object: public.applicant_referees | type: TABLE --
-- DROP TABLE IF EXISTS public.applicant_referees CASCADE;
CREATE TABLE public.applicant_referees(
	id bigserial NOT NULL,
	applicant_id bigint NOT NULL,
	first_name varchar(50) NOT NULL,
	surname varchar(50) NOT NULL,
	other_name varchar(50) NOT NULL,
	occupation varchar(50) NOT NULL,
	phone_no varchar(20) NOT NULL,
	email_address varchar(250) NOT NULL,
	CONSTRAINT pk_applicant_referee_id PRIMARY KEY (id)

);
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.applicant_referees 
(applicant_id,first_name,surname,other_name,occupation,phone_no,email_address) 
VALUES 
(2 ,'Collinz','Akoredes','Greatest','Civil Engineering Technology',08084574563,'collinsakor@gmail.com'),
(2 ,'Olufemi','Olusegun','Ayooluwa','Biochemistry Technology',0807435792,'oluayo@gmail.com'),

(3 ,'Goliath','Boluwatife','Lola','Chemistry Technology',0705634728,'goliath@gmail.com'),
(3 ,'David','Christopher','Gideon','Lab Attendance Technology',0804567486,'davido@gmail.com'),

(4 ,'Larry','Anuoluwa','Greatest','Civil Engineering Technology',08084574113,'larry@gmail.com'),
(4 ,'Babajide','Olusegun','Ayooluwa','Biochemistry Technology',0807435792,'oluayo@gmail.com'),

(5 ,'Juliet','Boluwatife','Bola','Chemistry Technology',0705644428,'juliet@gmail.com'),
(5 ,'Daniel','Christian','Gideon','Lab Attendance Technology',0804567486,'dano@gmail.com'),


(6 ,'Babalola','Bolu','Tola','Chemistry Technology',0705638828,'gogmagog@gmail.com'),
(6 ,'Daniel','Chris','Hezekiah','Lab Attendance Technology',0804567321,'endtime@gmail.com')

;

-- ddl-end --

-- object: public.lgas | type: TABLE --
-- DROP TABLE IF EXISTS public.lgas CASCADE;
CREATE TABLE public.lgas(
	id bigserial NOT NULL,
	state_id bigint,
	name varchar(100) NOT NULL,
	CONSTRAINT pk_lga_id PRIMARY KEY (id)

);
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.lgas (id, state_id,name) VALUES 
(0, 0, 'none');

INSERT INTO public.lgas (state_id,name) VALUES 
(1, 'Aba South'), (1, 'Arochukwu'), (1, 'Bende'), ( 1, 'Ikwuano'), 
(1, 'Isiala Ngwa North'), (1, 'Isiala Ngwa South'), (1, 'Isuikwuato'), 
(1, 'Obi Ngwa'), (1, 'Ohafia'), (1, 'Osisioma'), (1, 'Ugwunagbo'), 
(1, 'Ukwa East'), (1, 'Ukwa West'), (1, 'Umuahia North'), 
(1, 'Umuahia South'), (1, 'Umu Nneochi'), (2, 'Fufure'), 
(2, 'Ganye'), (2, 'Gayuk'), (2, 'Gombi'), (2, 'Grie'), 
(2, 'Hong'), (2, 'Jada'), (2, 'Lamurde'), (2, 'Madagali'), 
(2, 'Maiha'), (2, 'Mayo Belwa'), (2, 'Michika'), (2, 'Mubi North'), 
(2, 'Mubi South'), (2, 'Numan'), (2, 'Shelleng'), (2, 'Song'), 
(2, 'Toungo'), (2, 'Yola North'), (2, 'Yola South'), 
(3, 'Eastern Obolo'), (3, 'Eket'), (3, 'Esit Eket'), 
(3, 'Essien Udim'), (3, 'Etim Ekpo'), (3, 'Etinan'), (3, 'Ibeno'), 
(3, 'Ibesikpo Asutan'), (3, 'Ibiono-Ibom'), (3, 'Ika'), (3, 'Ikono'), 
(3, 'Ikot Abasi'), (3, 'Ikot Ekpene'), (3, 'Ini'), (3, 'Itu'), 
(3, 'Mbo'), (3, 'Mkpat-Enin'), (3, 'Nsit-Atai'), (3, 'Nsit-Ibom'), 
(3, 'Nsit-Ubium'), (3, 'Obot Akara'), (3, 'Okobo'), (3, 'Onna'),
(3, 'Oron'), (3, 'Oruk Anam'), (3, 'Udung-Uko'), (3, 'Ukanafun'), 
(3, 'Uruan'), (3, 'Urue-Offong/Oruko'), (3, 'Uyo'), 
(4, 'Anambra East'), (4, 'Anambra West'), (4, 'Anaocha'), 
(4, 'Awka North'), (4, 'Awka South'), (4, 'Ayamelum'), 
(4, 'Dunukofia'), (4, 'Ekwusigo'), (4, 'Idemili North'), 
(4, 'Idemili South'), (4, 'Ihiala'), (4, 'Njikoka'), 
(4, 'Nnewi North'), (4, 'Nnewi South'), (4, 'Ogbaru'), 
(4, 'Onitsha North'), (4, 'Onitsha South'), (4, 'Orumba North'), 
(4, 'Orumba South'), (4, 'Oyi'), (5, 'Bauchi'), (5, 'Bogoro'), 
(5, 'Damban'), (5, 'Darazo'), (5, 'Dass'), (5, 'Gamawa'), 
(5, 'Ganjuwa'), (5, 'Giade'), (5, 'Itas/Gadau'), (5, 'Jama''are'), 
(5, 'Katagum'), (5, 'Kirfi'), (5, 'Misau'), (5, 'Ningi'), 
(5, 'Shira'), (5, 'Tafawa Balewa'), (5, 'Toro'), (5, 'Warji'), 
(5, 'Zaki'), (6, 'Ekeremor'), (6, 'Kolokuma/Opokuma'), 
(6, 'Nembe'), (6, 'Ogbia'), (6, 'Sagbama'), (6, 'Southern Ijaw'), 
(6, 'Yenagoa'), (7, 'Apa'), (7, 'Ado'), (7, 'Buruku'), 
(7, 'Gboko'), (7, 'Guma'), (7, 'Gwer East'), (7, 'Gwer West'), 
(7, 'Katsina-Ala'), (7, 'Konshisha'), (7, 'Kwande'), (7, 'Logo'), 
(7, 'Makurdi'), (7, 'Obi'), (7, 'Ogbadibo'), (7, 'Ohimini'), 
(7, 'Oju'), (7, 'Okpokwu'), (7, 'Oturkpo'), (7, 'Tarka'), 
(7, 'Ukum'), (7, 'Ushongo'), (7, 'Vandeikya'), (8, 'Askira/Uba'), 
(8, 'Bama'), (8, 'Bayo'), (8, 'Biu'), (8, 'Chibok'), 
(8, 'Damboa'), (8, 'Dikwa'), (8, 'Gubio'), (8, 'Guzamala'), 
(8, 'Gwoza'), (8, 'Hawul'), (8, 'Jere'), (8, 'Kaga'), 
(8, 'Kala/Balge'), (8, 'Konduga'), (8, 'Kukawa'), 
(8, 'Kwaya Kusar'), (8, 'Mafa'), (8, 'Magumeri'), 
(8, 'Maiduguri'), (8, 'Marte'), (8, 'Mobbar'), (8, 'Monguno'), 
(8, 'Ngala'), (8, 'Nganzai'), (8, 'Shani'), (9, 'Akamkpa'), 
(9, 'Akpabuyo'), (9, 'Bakassi'), (9, 'Bekwarra'), (9, 'Biase'), 
(9, 'Boki'), (9, 'Calabar Municipal'), (9, 'Calabar South'), 
(9, 'Etung'), (9, 'Ikom'), (9, 'Obanliku'), (9, 'Obubra'), 
(9, 'Obudu'), (9, 'Odukpani'), (9, 'Ogoja'), (9, 'Yakuur'), 
(9, 'Yala'), (10, 'Aniocha South'), (10, 'Bomadi'), 
(10, 'Burutu'), (10, 'Ethiope East'), (10, 'Ethiope West'), 
(10, 'Ika North East'), (10, 'Ika South'), (10, 'Isoko North'), 
(10, 'Isoko South'), (10, 'Ndokwa East'), (10, 'Ndokwa West'), 
(10, 'Okpe'), (10, 'Oshimili North'), (10, 'Oshimili South'), 
(10, 'Patani'), (10, 'Sapele'), (10, 'Udu'), 
(10, 'Ughelli North'), (10, 'Ughelli South'), (10, 'Ukwuani'), 
(10, 'Uvwie'), (10, 'Warri North'), (10, 'Warri South'), 
(10, 'Warri South West'), (11, 'Afikpo North'), (11, 'Afikpo South'), 
(11, 'Ebonyi'), (11, 'Ezza North'), (11, 'Ezza South'), 
(11, 'Ikwo'), (11, 'Ishielu'), (11, 'Ivo'), (11, 'Izzi'), 
(11, 'Ohaozara'), (11, 'Ohaukwu'), (11, 'Onicha'), (12, 'Egor'), 
(12, 'Esan Central'), (12, 'Esan North-East'), (12, 'Esan South-East'), 
(12, 'Esan West'), (12, 'Etsako Central'), (12, 'Etsako East'), 
(12, 'Etsako West'), (12, 'Igueben'), (12, 'Ikpoba Okha'), 
(12, 'Orhionmwon'), (12, 'Oredo'), (12, 'Ovia North-East'), 
(12, 'Ovia South-West'), (12, 'Owan East'), (12, 'Owan West'), 
(12, 'Uhunmwonde'), (13, 'Efon'), (13, 'Ekiti East'), 
(13, 'Ekiti South-West'), (13, 'Ekiti West'), (13, 'Emure'), 
(13, 'Gbonyin'), (13, 'Ido Osi'), (13, 'Ijero'), (13, 'Ikere'), 
(13, 'Ikole'), (13, 'Ilejemeje'), (13, 'Irepodun/Ifelodun'), 
(13, 'Ise/Orun'), (13, 'Moba'), (13, 'Oye'), (14, 'Awgu'), 
(14, 'Enugu East'), (14, 'Enugu North'), (14, 'Enugu South'), 
(14, 'Ezeagu'), (14, 'Igbo Etiti'), (14, 'Igbo Eze North'), 
(14, 'Igbo Eze South'), (14, 'Isi Uzo'), (14, 'Nkanu East'), 
(14, 'Nkanu West'), (14, 'Nsukka'), (14, 'Oji River'), 
(14, 'Udenu'), (14, 'Udi'), (14, 'Uzo Uwani'), (15, 'Bwari'), 
(15, 'Gwagwalada'), (15, 'Kuje'), (15, 'Kwali'), 
(15, 'Municipal Area Council'), (16, 'Balanga'), (16, 'Billiri'), 
(16, 'Dukku'), (16, 'Funakaye'), (16, 'Gombe'), (16, 'Kaltungo'), 
(16, 'Kwami'), (16, 'Nafada'), (16, 'Shongom'), (16, 'Yamaltu/Deba'), 
(17, 'Ahiazu Mbaise'), (17, 'Ehime Mbano'), (17, 'Ezinihitte'), 
(17, 'Ideato North'), (17, 'Ideato South'), (17, 'Ihitte/Uboma'), 
(17, 'Ikeduru'), (17, 'Isiala Mbano'), (17, 'Isu'), 
(17, 'Mbaitoli'), (17, 'Ngor Okpala'), (17, 'Njaba'), 
(17, 'Nkwerre'), (17, 'Nwangele'), (17, 'Obowo'), (17, 'Oguta'), 
(17, 'Ohaji/Egbema'), (17, 'Okigwe'), (17, 'Orlu'), (17, 'Orsu'), 
(17, 'Oru East'), (17, 'Oru West'), (17, 'Owerri Municipal'), 
(17, 'Owerri North'), (17, 'Owerri West'), (17, 'Unuimo'), 
(18, 'Babura'), (18, 'Biriniwa'), (18, 'Birnin Kudu'), 
(18, 'Buji'), (18, 'Dutse'), (18, 'Gagarawa'), (18, 'Garki'), 
(18, 'Gumel'), (18, 'Guri'), (18, 'Gwaram'), (18, 'Gwiwa'), 
(18, 'Hadejia'), (18, 'Jahun'), (18, 'Kafin Hausa'), 
(18, 'Kazaure'), (18, 'Kiri Kasama'), (18, 'Kiyawa'), 
(18, 'Kaugama'), (18, 'Maigatari'), (18, 'Malam Madori'), 
(18, 'Miga'), (18, 'Ringim'), (18, 'Roni'), 
(18, 'Sule Tankarkar'), (18, 'Taura'), (18, 'Yankwashi'), 
(19, 'Chikun'), (19, 'Giwa'), (19, 'Igabi'), (19, 'Ikara'), 
(19, 'Jaba'), (19, 'Jema''a'), (19, 'Kachia'), 
(19, 'Kaduna North'), (19, 'Kaduna South'), (19, 'Kagarko'), 
(19, 'Kajuru'), (19, 'Kaura'), (19, 'Kauru'), (19, 'Kubau'), 
(19, 'Kudan'), (19, 'Lere'), (19, 'Makarfi'), (19, 'Sabon Gari'), 
(19, 'Sanga'), (19, 'Soba'), (19, 'Zangon Kataf'), (19, 'Zaria'), 
(20, 'Albasu'), (20, 'Bagwai'), (20, 'Bebeji'), (20, 'Bichi'), 
(20, 'Bunkure'), (20, 'Dala'), (20, 'Dambatta'), (20, 'Dawakin Kudu'), 
(20, 'Dawakin Tofa'), (20, 'Doguwa'), (20, 'Fagge'), (20, 'Gabasawa'), 
(20, 'Garko'), (20, 'Garun Mallam'), (20, 'Gaya'), (20, 'Gezawa'), 
(20, 'Gwale'), (20, 'Gwarzo'), (20, 'Kabo'), (20, 'Kano Municipal'), 
(20, 'Karaye'), (20, 'Kibiya'), (20, 'Kiru'), (20, 'Kumbotso'), 
(20, 'Kunchi'), (20, 'Kura'), (20, 'Madobi'), (20, 'Makoda'), 
(20, 'Minjibir'), (20, 'Nasarawa'), (20, 'Rano'), (20, 'Rimin Gado'), 
(20, 'Rogo'), (20, 'Shanono'), (20, 'Sumaila'), (20, 'Takai'), 
(20, 'Tarauni'), (20, 'Tofa'), (20, 'Tsanyawa'), (20, 'Tudun Wada'), 
(20, 'Ungogo'), (20, 'Warawa'), (20, 'Wudil'), (21, 'Batagarawa'), 
(21, 'Batsari'), (21, 'Baure'), (21, 'Bindawa'), (21, 'Charanchi'), 
(21, 'Dandume'), (21, 'Danja'), (21, 'Dan Musa'), (21, 'Daura'), 
(21, 'Dutsi'), (21, 'Dutsin Ma'), (21, 'Faskari'), (21, 'Funtua'), 
(21, 'Ingawa'), (21, 'Jibia'), (21, 'Kafur'), (21, 'Kaita'), 
(21, 'Kankara'), (21, 'Kankia'), (21, 'Katsina'), (21, 'Kurfi'), 
(21, 'Kusada'), (21, 'Mai''Adua'), (21, 'Malumfashi'), (21, 'Mani'), 
(21, 'Mashi'), (21, 'Matazu'), (21, 'Musawa'), (21, 'Rimi'), 
(21, 'Sabuwa'), (21, 'Safana'), (21, 'Sandamu'), (21, 'Zango'), 
(22, 'Arewa Dandi'), (22, 'Argungu'), (22, 'Augie'), (22, 'Bagudo'), 
(22, 'Birnin Kebbi'), (22, 'Bunza'), (22, 'Dandi'), (22, 'Fakai'), 
(22, 'Gwandu'), (22, 'Jega'), (22, 'Kalgo'), (22, 'Koko/Besse'), 
(22, 'Maiyama'), (22, 'Ngaski'), (22, 'Sakaba'), (22, 'Shanga'), 
(22, 'Suru'), (22, 'Wasagu/Danko'), (22, 'Yauri'), (22, 'Zuru'), 
(23, 'Ajaokuta'), (23, 'Ankpa'), (23, 'Bassa'), (23, 'Dekina'), 
(23, 'Ibaji'), (23, 'Idah'), (23, 'Igalamela Odolu'), (23, 'Ijumu'), 
(23, 'Kabba/Bunu'), (23, 'Kogi'), (23, 'Lokoja'), (23, 'Mopa Muro'), 
(23, 'Ofu'), (23, 'Ogori/Magongo'), (23, 'Okehi'), (23, 'Okene'), 
(23, 'Olamaboro'), (23, 'Omala'), (23, 'Yagba East'), (23, 'Yagba West'), 
(24, 'Baruten'), (24, 'Edu'), (24, 'Ekiti'), (24, 'Ifelodun'), 
(24, 'Ilorin East'), (24, 'Ilorin South'), (24, 'Ilorin West'), 
(24, 'Irepodun'), (24, 'Isin'), (24, 'Kaiama'), (24, 'Moro'), 
(24, 'Offa'), (24, 'Oke Ero'), (24, 'Oyun'), (24, 'Pategi'), 
(25, 'Ajeromi-Ifelodun'), (25, 'Alimosho'), (25, 'Amuwo-Odofin'), 
(25, 'Apapa'), (25, 'Badagry'), (25, 'Epe'), (25, 'Eti Osa'), 
(25, 'Ibeju-Lekki'), (25, 'Ifako-Ijaiye'), (25, 'Ikeja'), 
(25, 'Ikorodu'), (25, 'Kosofe'), (25, 'Lagos Island'), 
(25, 'Lagos Mainland'), (25, 'Mushin'), (25, 'Ojo'), 
(25, 'Oshodi-Isolo'), (25, 'Shomolu'), (25, 'Surulere'), 
(26, 'Awe'), (26, 'Doma'), (26, 'Karu'), (26, 'Keana'), 
(26, 'Keffi'), (26, 'Kokona'), (26, 'Lafia'), (26, 'Nasarawa'), 
(26, 'Nasarawa Egon'), (26, 'Obi'), (26, 'Toto'), (26, 'Wamba'), 
(27, 'Agwara'), (27, 'Bida'), (27, 'Borgu'), (27, 'Bosso'), 
(27, 'Chanchaga'), (27, 'Edati'), (27, 'Gbako'), (27, 'Gurara'), 
(27, 'Katcha'), (27, 'Kontagora'), (27, 'Lapai'), (27, 'Lavun'), 
(27, 'Magama'), (27, 'Mariga'), (27, 'Mashegu'), (27, 'Mokwa'), 
(27, 'Moya'), (27, 'Paikoro'), (27, 'Rafi'), (27, 'Rijau'), 
(27, 'Shiroro'), (27, 'Suleja'), (27, 'Tafa'), (27, 'Wushishi'), 
(28, 'Abeokuta South'), (28, 'Ado-Odo/Ota'), (28, 'Egbado North'), 
(28, 'Egbado South'), (28, 'Ewekoro'), (28, 'Ifo'), (28, 'Ijebu East'), 
(28, 'Ijebu North'), (28, 'Ijebu North East'), (28, 'Ijebu Ode'), 
(28, 'Ikenne'), (28, 'Imeko Afon'), (28, 'Ipokia'), (28, 'Obafemi Owode'), 
(28, 'Odeda'), (28, 'Odogbolu'), (28, 'Ogun Waterside'), 
(28, 'Remo North'), (28, 'Shagamu'), (29, 'Akoko North-West'), 
(29, 'Akoko South-West'), (29, 'Akoko South-East'), (29, 'Akure North'), 
(29, 'Akure South'), (29, 'Ese Odo'), (29, 'Idanre'), 
(29, 'Ifedore'), (29, 'Ilaje'), (29, 'Ile Oluji/Okeigbo'), 
(29, 'Irele'), (29, 'Odigbo'), (29, 'Okitipupa'), (29, 'Ondo East'), 
(29, 'Ondo West'), (29, 'Ose'), (29, 'Owo'), (30, 'Atakunmosa West'), 
(30, 'Aiyedaade'), (30, 'Aiyedire'), (30, 'Boluwaduro'), (30, 'Boripe'), 
(30, 'Ede North'), (30, 'Ede South'), (30, 'Ife Central'), (30, 'Ife East'), 
(30, 'Ife North'), (30, 'Ife South'), (30, 'Egbedore'), (30, 'Ejigbo'), 
(30, 'Ifedayo'), (30, 'Ifelodun'), (30, 'Ila'), (30, 'Ilesa East'), 
(30, 'Ilesa West'), (30, 'Irepodun'), (30, 'Irewole'), (30, 'Isokan'), 
(30, 'Iwo'), (30, 'Obokun'), (30, 'Odo Otin'), (30, 'Ola Oluwa'), 
(30, 'Olorunda'), (30, 'Oriade'), (30, 'Orolu'), (30, 'Osogbo'), 
(31, 'Akinyele'), (31, 'Atiba'), (31, 'Atisbo'), (31, 'Egbeda'), 
(31, 'Ibadan North'), (31, 'Ibadan North-East'), (31, 'Ibadan North-West'), 
(31, 'Ibadan South-East'), (31, 'Ibadan South-West'), (31, 'Ibarapa Central'), 
(31, 'Ibarapa East'), (31, 'Ibarapa North'), (31, 'Ido'), (31, 'Irepo'), 
(31, 'Iseyin'), (31, 'Itesiwaju'), (31, 'Iwajowa'), (31, 'Kajola'), 
(31, 'Lagelu'), (31, 'Ogbomosho North'), (31, 'Ogbomosho South'), 
(31, 'Ogo Oluwa'), (31, 'Olorunsogo'), (31, 'Oluyole'), (31, 'Ona Ara'), 
(31, 'Orelope'), (31, 'Ori Ire'), (31, 'Oyo'), (31, 'Oyo East'), 
(31, 'Saki East'), (31, 'Saki West'), (31, 'Surulere'), (32, 'Barkin Ladi'), 
(32, 'Bassa'), (32, 'Jos East'), (32, 'Jos North'), (32, 'Jos South'), 
(32, 'Kanam'), (32, 'Kanke'), (32, 'Langtang South'), (32, 'Langtang North'), 
(32, 'Mangu'), (32, 'Mikang'), (32, 'Pankshin'), (32, 'Qua''an Pan'), 
(32, 'Riyom'), (32, 'Shendam'), (32, 'Wase'), (33, 'Ahoada East'), 
(33, 'Ahoada West'), (33, 'Akuku-Toru'), (33, 'Andoni'), (33, 'Asari-Toru'), 
(33, 'Bonny'), (33, 'Degema'), (33, 'Eleme'), (33, 'Emuoha'), 
(33, 'Etche'), (33, 'Gokana'), (33, 'Ikwerre'), (33, 'Khana'), 
(33, 'Obio/Akpor'), (33, 'Ogba/Egbema/Ndoni'), (33, 'Ogu/Bolo'), 
(33, 'Okrika'), (33, 'Omuma'), (33, 'Opobo/Nkoro'), (33, 'Oyigbo'), 
(33, 'Port Harcourt'), (33, 'Tai'), (34, 'Bodinga'), (34, 'Dange Shuni'), 
(34, 'Gada'), (34, 'Goronyo'), (34, 'Gudu'), (34, 'Gwadabawa'), 
(34, 'Illela'), (34, 'Isa'), (34, 'Kebbe'), (34, 'Kware'), 
(34, 'Rabah'), (34, 'Sabon Birni'), (34, 'Shagari'), (34, 'Silame'), 
(34, 'Sokoto North'), (34, 'Sokoto South'), (34, 'Tambuwal'), 
(34, 'Tangaza'), (34, 'Tureta'), (34, 'Wamako'), (34, 'Wurno'), 
(34, 'Yabo'), (35, 'Bali'), (35, 'Donga'), (35, 'Gashaka'), 
(35, 'Gassol'), (35, 'Ibi'), (35, 'Jalingo'), (35, 'Karim Lamido'), 
(35, 'Kumi'), (35, 'Lau'), (35, 'Sardauna'), (35, 'Takum'), 
(35, 'Ussa'), (35, 'Wukari'), (35, 'Yorro'), (35, 'Zing'), 
(36, 'Bursari'), (36, 'Damaturu'), (36, 'Fika'), (36, 'Fune'), 
(36, 'Geidam'), (36, 'Gujba'), (36, 'Gulani'), (36, 'Jakusko'), 
(36, 'Karasuwa'), (36, 'Machina'), (36, 'Nangere'), (36, 'Nguru'), 
(36, 'Potiskum'), (36, 'Tarmuwa'), (36, 'Yunusari'), (36, 'Yusufari'), 
(37, 'Bakura'), (37, 'Birnin Magaji/Kiyaw'), (37, 'Bukkuyum'), 
(37, 'Bungudu'), (37, 'Gummi'), (37, 'Gusau'), (37, 'Kaura Namoda'), 
(37, 'Maradun'), (37, 'Maru'), (37, 'Shinkafi'), (37, 'Talata Mafara'), 
(37, 'Chafe'), (37, 'Zurmi');

-- ddl-end --

-- object: public.uploads | type: TABLE --
-- DROP TABLE IF EXISTS public.uploads CASCADE;
CREATE TABLE public.uploads(
	id bigserial NOT NULL,
	file_path varchar(250) NOT NULL,
	size bigint NOT NULL,
	type smallint NOT NULL,
	CONSTRAINT pk_upload_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.uploads.type IS '0 == images, 1 == documents, 2 == other files';
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.uploads (id,file_path,size,type) VALUES 
(0,'none',0,0);
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.uploads (file_path,size,type) VALUES 
('uploaded/passport1.png',449,0),
('uploaded/birthcertificate1.jpg',33332,0),
('uploaded/neco.jpeg',63275,0),

('uploaded/passport2.jpg',11409,0),
('uploaded/birthcertificate1.jpg',33332,0),
('uploaded/neco2.jpeg',63275,0),

('uploaded/passport3.jpg',13755,0),
('uploaded/birthcertificate3.jpg',33332,0),
('uploaded/waec2.png',9179,0),

('uploaded/passport4.png',449,0),
('uploaded/birthcertificate4.jpg',33332,0),
('uploaded/waec3.png',9179,0),

('uploaded/passport5.jpg',11409,0),
('uploaded/birthcertificate5.jpg',33332,0),
('uploaded/waec4.png',9179,0)

;
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.uploads (file_path,size,type) VALUES ('uploaded/oie_RUnVjmnmxvmB.jpg',7504,0);
-- ddl-end --

-- object: public.transactions | type: TABLE --
-- DROP TABLE IF EXISTS public.transactions CASCADE;
CREATE TABLE public.transactions(
	id bigserial NOT NULL,
	amount numeric(15,2) NOT NULL,
	type smallint NOT NULL DEFAULT 1,
	date timestamp NOT NULL DEFAULT LOCALTIMESTAMP,
	source integer NOT NULL,
	destination integer NOT NULL,
	teller_detail json NOT NULL,
	payment_status smallint NOT NULL ,
	upload_id bigint NOT NULL,
	CONSTRAINT pk_transaction_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.transactions.type IS '0 - debit, 1 - credit';
-- ddl-end --
COMMENT ON COLUMN public.transactions.source IS '0 - "offline transaction" 1 - "online transaction"';
-- ddl-end --
COMMENT ON COLUMN public.transactions.destination IS '0 - local bank , 1 - online bank';
-- ddl-end --
COMMENT ON COLUMN public.transactions.teller_detail IS 'teller detail used for bank payment';
-- ddl-end --
COMMENT ON COLUMN public.transactions.payment_status IS 'either 0 - unpaid, 1 - pending, 2 - completed';
-- ddl-end --

-- Appended SQL commands --

INSERT INTO public.transactions (amount,type,date,source,destination,teller_detail, payment_status, upload_id) 
VALUES 
(5000,1,'2015-09-12',1,1,'{"name": "nil"}', 2, 0),
(5000,1,'2015-09-13',1,1, '{"name": "nil"}', 2, 0),


(36000,1,'2015-12-12',1,1,'{"name": "nil"}', 2, 0),
(36000,1,'2015-12-13',1,1,'{"name": "nil"}', 2, 0),

-- (230000,1,'2016-09-12',0,0),
(90000,1,'2016-09-12',1,1,'{"name": "nil"}', 2, 0),
(130000,1,'2016-09-12',1,1,'{"name": "nil"}', 2, 0),
(10000,1,'2016-09-12',1,1,'{"name": "nil"}', 2, 0),

(90000,1,'2016-09-13',1,1,'{"name": "nil"}', 2, 0),
(130000,1,'2016-09-13',1,1,'{"name": "nil"}', 2, 0),
(10000,1,'2016-09-13',1,1,'{"name": "nil"}', 2, 0),


(5000,1,'2016-09-12',1,1,'{"name": "nil"}', 2, 0),
(5000,1,'2016-09-13',1,1,'{"name": "nil"}', 2, 0),

(20000,1,'2016-12-12',1,1,'{"name": "nil"}', 2, 0),
(20000,1,'2016-12-13',1,1,'{"name": "nil"}', 2, 0),


-- (230000,1,'2017-03-12',0,0),
(90000,1,'2017-03-12',1,1,'{"name": "nil"}', 2, 0),
(130000,1,'2017-03-12',1,1,'{"name": "nil"}', 2, 0),
(10000,1,'2017-03-12',1,1,'{"name": "nil"}', 2, 0),

(90000,1,'2017-03-13',1,1,'{"name": "nil"}', 2, 0),
(130000,1,'2017-03-13',1,1,'{"name": "nil"}', 2, 0),
(10000,1,'2017-03-13',1,1,'{"name": "nil"}', 2, 0),


(5000,1,'2017-09-12',1,1,'{"name": "nil"}', 2, 0),


-- (230000,1,'2017-03-12',0,0)
(90000,1,'2017-09-12',1,1,'{"name": "nil"}', 2, 0),
(130000,1,'2017-09-12',1,1,'{"name": "nil"}', 2, 0),
(10000,1,'2017-09-12',1,1,'{"name": "nil"}', 2, 0)


;
-- ddl-end --

-- object: public.payments | type: TABLE --
-- DROP TABLE IF EXISTS public.payments CASCADE;
CREATE TABLE public.payments(
	id bigserial NOT NULL,
	person_id bigint NOT NULL,
	transaction_id bigint NOT NULL,
	invoice_bill_id bigint NOT NULL,
	-- person_id bigint NOT NULL,
	payment_mode_id smallint NOT NULL,
	CONSTRAINT pk_payments_id PRIMARY KEY (id)

);
-- ddl-end --

-- Appended SQL commands --

INSERT INTO public.payments 
(person_id,transaction_id,invoice_bill_id,payment_mode_id) VALUES 
(2,1,1,1),
(3,2,1,1),

(2,3,2,1),
(3,4,2,1),

(2,5,5,1),
(2,6,6,1),
(2,7,7,1),

(3,8,5,1),
(3,9,6,1),
(3,10,7,1),

(4,11,3,1),
(5,12,3,1),

(4,13,4,1),
(5,14,4,1),

(2,15,8,1),
(2,16,9,1),
(2,17,10,1),

(3,18,8,1),
(3,19,9,1),
(3,20,10,1),


(6,21,11,1),


(2,22,13,1),
(2,23,14,1),
(2,24,15,1)


;
-- ddl-end --

-- object: public.payment_modes | type: TABLE --
-- DROP TABLE IF EXISTS public.payment_modes CASCADE;
CREATE TABLE public.payment_modes(
	id smallserial NOT NULL,
	type varchar(30) NOT NULL,
	CONSTRAINT pk_payment_mode_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.payment_modes IS 'Payments can either be online or offline';
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.payment_modes (id,type) VALUES 
(1,'offline'),
(2,'online')
;
-- ddl-end --

-- object: public.banks | type: TABLE --
-- DROP TABLE IF EXISTS public.banks CASCADE;
CREATE TABLE public.banks(
	id serial NOT NULL,
	name varchar(50) NOT NULL,
	account_no varchar(12) NOT NULL,
	CONSTRAINT pk_bank_id PRIMARY KEY (id)

);
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.banks(name, account_no) VALUES
('Diamond bank', '0093123141'),
('Access bank', '0067353873'),
('Guaranty Trust Bank', '0032436373')
;



-- object: public.nationalities | type: TABLE --
-- DROP TABLE IF EXISTS public.nationalities CASCADE;
CREATE TABLE public.nationalities(
	id bigserial NOT NULL,
	name varchar(50) NOT NULL,
	CONSTRAINT pk_nationalities_id PRIMARY KEY (id)

);
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.nationalities (id, name) VALUES 
(0, 'none');

INSERT INTO public.nationalities (name) VALUES 
('Afghan'),
('Albanian'),
('Algerian'),
('American'),
('Andorran'),
('Angolan'),
('Antiguans'),
('Argentinean'),
('Armenian'),
('Australian'),
('Austrian'),
('Azerbaijani'),
('Bahamian'),
('Bahraini'),
('Bangladeshi'),
('Barbadian'),
('Barbudans'),
('Batswana'),
('Belarusian'),
('Belgian'),
('Belizean'),
('Beninese'),
('Bhutanese'),
('Bolivian'),
('Bosnian'),
('Brazilian'),
('British'),
('Bruneian'),
('Bulgarian'),
('Burkinabe'),
('Burmese'),
('Burundian'),
('Cambodian'),
('Cameroonian'),
('Canadian'),
('Cape Verdean'),
('Central African'),
('Chadian'),
('Chilean'),
('Chinese'),
('Colombian'),
('Comoran'),
('Congolese'),
('Costa Rican'),
('Croatian'),
('Cuban'),
('Cypriot'),
('Czech'),
('Danish'),
('Djibouti'),
('Dominican'),
('Dutch'),
('East Timorese'),
('Ecuadorean'),
('Egyptian'),
('Emirian'),
('Equatorial Guinean'),
('Eritrean'),
('Estonian'),
('Ethiopian'),
('Fijian'),
('Filipino'),
('Finnish'),
('French'),
('Gabonese'),
('Gambian'),
('Georgian'),
('German'),
('Ghanaian'),
('Greek'),
('Grenadian'),
('Guatemalan'),
('Guinea-Bissauan'),
('Guinean'),
('Guyanese'),
('Haitian'),
('Herzegovinian'),
('Honduran'),
('Hungarian'),
('I-Kiribati'),
('Icelander'),
('Indian'),
('Indonesian'),
('Iranian'),
('Iraqi'),
('Irish'),
('Israeli'),
('Italian'),
('Ivorian'),
('Jamaican'),
('Japanese'),
('Jordanian'),
('Kazakhstani'),
('Kenyan'),
('Kittian and Nevisian'),
('Kuwaiti'),
('Kyrgyz'),
('Laotian'),
('Latvian'),
('Lebanese'),
('Liberian'),
('Libyan'),
('Liechtensteiner'),
('Lithuanian'),
('Luxembourger'),
('Macedonian'),
('Malagasy'),
('Malawian'),
('Malaysian'),
('Maldivan'),
('Malian'),
('Maltese'),
('Marshallese'),
('Mauritanian'),
('Mauritian'),
('Mexican'),
('Micronesian'),
('Moldovan'),
('Monacan'),
('Mongolian'),
('Moroccan'),
('Mosotho'),
('Motswana'),
('Mozambican'),
('Namibian'),
('Nauruan'),
('Nepalese'),
('New Zealander'),
('Nicaraguan'),
('Nigerian'),
('Nigerien'),
('North Korean'),
('Northern Irish'),
('Norwegian'),
('Omani'),
('Pakistani'),
('Palauan'),
('Panamanian'),
('Papua New Guinean'),
('Paraguayan'),
('Peruvian'),
('Polish'),
('Portuguese'),
('Qatari'),
('Romanian'),
('Russian'),
('Rwandan'),
('Saint Lucian'),
('Salvadoran'),
('Samoan'),
('San Marinese'),
('Sao Tomean'),
('Saudi'),
('Scottish'),
('Senegalese'),
('Serbian'),
('Seychellois'),
('Sierra Leonean'),
('Singaporean'),
('Slovakian'),
('Slovenian'),
('Solomon Islander'),
('Somali'),
('South African'),
('South Korean'),
('Spanish'),
('Sri Lankan'),
('Sudanese'),
('Surinamer'),
('Swazi'),
('Swedish'),
('Swiss'),
('Syrian'),
('Taiwanese'),
('Tajik'),
('Tanzanian'),
('Thai'),
('Togolese'),
('Tongan'),
('Trinidadian or Tobagonian'),
('Tunisian'),
('Turkish'),
('Tuvaluan'),
('Ugandan'),
('Ukrainian'),
('Uruguayan'),
('Uzbekistani'),
('Venezuelan'),
('Vietnamese'),
('Welsh'),
('Yemenite'),
('Zambian'),
('Zimbabwean');

-- ddl-end --

-- object: public.registrations | type: TABLE --
-- DROP TABLE IF EXISTS public.registrations CASCADE;
CREATE TABLE public.registrations(
	id bigserial NOT NULL,
	student_id bigint NOT NULL,
	step smallint NOT NULL DEFAULT 0,
	payment_status smallint NOT NULL DEFAULT 0,
	registration_status varchar(15) NOT NULL,
	CONSTRAINT pk_registration_id PRIMARY KEY (id)

);
-- ddl-end --

-- object: public.religions | type: TABLE --
-- DROP TABLE IF EXISTS public.religions CASCADE;
CREATE TABLE public.religions(
	id serial NOT NULL,
	name varchar(45) NOT NULL,
	CONSTRAINT pk_religions_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.religions IS '(1 - ''christianity''),
(2 - ''islamic''),
(3 - ''others'');';
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.religions (id,name) 
VALUES 
	(0, 'none');


INSERT INTO public.religions (name) VALUES 
('christianity'),
('islamic'),
('others');
-- ddl-end --

-- object: public.applicant_uploads | type: TABLE --
-- DROP TABLE IF EXISTS public.applicant_uploads CASCADE;
CREATE TABLE public.applicant_uploads(
	id bigserial NOT NULL,
	upload_id bigint NOT NULL,
	applicant_id varchar(15) NOT NULL,
	type smallint NOT NULL,
	CONSTRAINT pk_applicant_upload_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.applicant_uploads.upload_id IS 'identification number of the file';
-- ddl-end --
COMMENT ON COLUMN public.applicant_uploads.applicant_id IS 'owner''s id';
-- ddl-end --
COMMENT ON COLUMN public.applicant_uploads.type IS '0 == passport , 1 == birthcert, 2 == neco, 3 == waec, 4 == other_docs, 5 == csv, 6 == a level, 7 == transcript';
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.applicant_uploads (upload_id,applicant_id,type) VALUES 
(1,2,0),
(2,2,1),
(3,2,2),

(4,3,0),
(5,3,1),
(6,3,2),

(7,4,0),
(8,4,1),
(9,4,2),

(10,5,0),
(11,5,1),
(12,5,2),

(13,6,0),
(14,6,1),
(15,6,2)

;
-- ddl-end --

-- object: public.semester_registrations | type: TABLE --
-- DROP TABLE IF EXISTS public.semester_registrations CASCADE;
CREATE TABLE public.semester_registrations(
	id bigserial NOT NULL,
	semester_id bigint NOT NULL,
	student_id bigint NOT NULL,
	CONSTRAINT pk_semester_registration_id PRIMARY KEY (id)

);
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.semester_registrations (semester_id,student_id) 
VALUES 
(3,2),
(3,3),

(4,2),
(4,3)

;
-- ddl-end --

-- object: public.semesters | type: TABLE --
-- DROP TABLE IF EXISTS public.semesters CASCADE;
CREATE TABLE public.semesters(
	id bigserial NOT NULL,
	session_id bigint NOT NULL,
	index smallint NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	result_status smallint NOT NULL,
	CONSTRAINT pk_semester_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.semesters.index IS 'refers to the semester whether its 1 or 2';
-- ddl-end --
COMMENT ON COLUMN public.semesters.start_date IS 'start date for this semester';
-- ddl-end --
COMMENT ON COLUMN public.semesters.end_date IS 'end date for this semester';
-- ddl-end --
COMMENT ON COLUMN public.semesters.result_status IS 'result status for a semester';
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.semesters (session_id,index,start_date,end_date, result_status) VALUES 
(1,1,'2015-12-12','2016-04-23', 1),
(1,2,'2016-05-12','2016-11-23', 1),

(2,1,'2016-12-12','2017-04-23', 3),
(2,2,'2017-05-12','2017-11-23', 3),

(3,1,'2017-12-12','2018-04-23', 1),
(3,2,'2018-05-12','2018-11-23', 1),

(4,1,'2018-12-12','2019-04-23', 1),
(4,2,'2019-05-12','2019-11-23', 1),

(5,1,'2019-12-12','2020-04-23', 1),
(5,2,'2020-05-12','2020-11-23', 1),

(6,1,'2020-12-12','2021-04-23', 1),
(6,2,'2021-05-12','2021-11-23', 1),

(7,1,'2021-12-12','2022-04-23', 1),
(7,2,'2022-05-12','2022-11-23', 1),

(8,1,'2022-12-12','2023-04-23', 1),
(8,2,'2023-05-12','2023-11-23', 1)

;

-- ddl-end --

-- object: public.semester_courses | type: TABLE --
-- DROP TABLE IF EXISTS public.semester_courses CASCADE;
CREATE TABLE public.semester_courses(
	id bigserial NOT NULL,
	semester_id bigint NOT NULL,
	student_id bigint NOT NULL,
	course_id bigint NOT NULL,
	CONSTRAINT pk_semester_course_id PRIMARY KEY (id)

);
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.semester_courses (semester_id,student_id,course_id) 
VALUES
 
(3,2,1),
(3,2,2),
(3,2,3),
(3,2,4),
(3,2,5),
(3,2,6),
(3,2,7),
(3,2,8),


(3,3,1),
(3,3,2),
(3,3,3),
(3,3,4),
(3,3,5),
(3,3,6),
(3,3,7),
(3,3,8),


(4,2,9),
(4,2,10),
(3,2,11),
(4,2,12),
(4,2,13),
(4,2,14),
(4,2,15),
(4,2,16),


(4,3,9),
(4,3,10),
(3,3,11),
(4,3,12),
(4,3,13),
(4,3,14),
(4,3,15),
(4,3,16)





;

-- ddl-end --

-- object: public.academic_sessions | type: TABLE --
-- DROP TABLE IF EXISTS public.academic_sessions CASCADE;
CREATE TABLE public.academic_sessions(
	id bigserial NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	CONSTRAINT pk_academic_session_id PRIMARY KEY (id)

);
-- ddl-end --

-- Appended SQL commands --

INSERT INTO public.academic_sessions (id, start_date,end_date) 
VALUES 
(0, '0001-01-01','0001-01-01');

INSERT INTO public.academic_sessions (start_date,end_date) 
VALUES 
('2015-12-12','2016-11-23'),
('2016-12-12','2017-11-23'),
('2017-12-12','2018-11-23'),
('2018-12-12','2019-11-23'),

('2019-12-12','2020-11-23'),
('2020-12-12','2021-11-23'),
('2021-12-12','2022-11-23'),
('2022-12-12','2023-11-23');

-- ddl-end --

-- object: public.authentications | type: TABLE --
-- DROP TABLE IF EXISTS public.authentications CASCADE;
CREATE TABLE public.authentications(
	id bigserial NOT NULL,
	person_id bigint NOT NULL,
	password varchar(65) NOT NULL,
	staff_role smallint NOT NULL,
	login_status bool NOT NULL DEFAULT false,
	reset_token text NOT NULL DEFAULT '',
	CONSTRAINT pk_authentication_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.authentications.staff_role IS '0 - applicant/student, 1 - staff, 2 - lower-admin, 3 - super-admin';
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.authentications (person_id,password,staff_role,login_status) 
VALUES 
(1,'$2a$14$A9bDH1O3A3a9JKgkPlvPF.j/LCVdX5xLuIIKn2B10CxlGz7w.8N5e',5,false),

(2,'$2a$14$U.X/AHyUsDN6heLqUWFdJe1sv5DzHUfSEFPmAFy375CxBdMoyOli6',0,false),
(3,'$2a$14$U.X/AHyUsDN6heLqUWFdJe1sv5DzHUfSEFPmAFy375CxBdMoyOli6',0,false),
(4,'$2a$14$U.X/AHyUsDN6heLqUWFdJe1sv5DzHUfSEFPmAFy375CxBdMoyOli6',0,false),
(5,'$2a$14$U.X/AHyUsDN6heLqUWFdJe1sv5DzHUfSEFPmAFy375CxBdMoyOli6',0,false),

(7,'$2a$14$A9bDH1O3A3a9JKgkPlvPF.j/LCVdX5xLuIIKn2B10CxlGz7w.8N5e',4,false),
(8,'$2a$14$A9bDH1O3A3a9JKgkPlvPF.j/LCVdX5xLuIIKn2B10CxlGz7w.8N5e',3,false),
(9,'$2a$14$A9bDH1O3A3a9JKgkPlvPF.j/LCVdX5xLuIIKn2B10CxlGz7w.8N5e',2,false),
(10,'$2a$14$A9bDH1O3A3a9JKgkPlvPF.j/LCVdX5xLuIIKn2B10CxlGz7w.8N5e',1,false)
;
-- ddl-end --

-- object: public.admins | type: TABLE --
-- DROP TABLE IF EXISTS public.admins CASCADE;
-- CREATE TABLE public.admins(
-- 	id bigint NOT NULL,
-- 	admin_no varchar(10) NOT NULL,
-- 	type smallint NOT NULL,
-- 	CONSTRAINT pk_admin_id PRIMARY KEY (id),
-- 	CONSTRAINT uk_admin_admin_no UNIQUE (admin_no)

-- );
-- ddl-end --
-- COMMENT ON COLUMN public.admins.type IS '2 - super-admin, 1 - normal-admin, 0 - lowest-admin';
-- ddl-end --

-- Appended SQL commands --
-- INSERT INTO public.admins (id,admin_no,type) VALUES 
-- (1,'5678',2);
-- ddl-end --

-- DROP TABLE IF EXIST public.admin_emails CASCADE;
CREATE TABLE public.admin_emails(
	id bigserial NOT NULL,
	subject varchar(50) NOT NULL,
	message text NOT NULL,
	sender varchar(50) NOT NULL,
	date  timestamp NOT NULL DEFAULT LOCALTIMESTAMP,
	CONSTRAINT pk_admin_email_id PRIMARY KEY (id)

);

-- DROP TABLE IF EXIST public.admin_sms CASCADE;
CREATE TABLE public.admin_sms(
	id bigserial NOT NULL,
	subject varchar(50) NOT NULL,
	message text NOT NULL,
	sender varchar(50) NOT NULL,
	date  timestamp NOT NULL DEFAULT LOCALTIMESTAMP,
	CONSTRAINT pk_admin_sms_id PRIMARY KEY (id)

);


-- DROP TABLE IF EXIST public.roles CASCADE;
CREATE TABLE public.roles(
	id smallint NOT NULL,
	name varchar(25) NOT NULL,
	privileges json NOT NULL,
	CONSTRAINT pk_roles_id PRIMARY KEY (id)

);

--ddl-end --
COMMENT ON TABLE public.roles IS 'to contain json representing the privileges of each role id
where 
[
	{"access": 1},
	{"access": 2},
	{"access": 3}
]
 means this admin should have access to class, lecture, exams features
where 
[
	{"access": 1},
	{"access": 2},
	{"access": 3},
	{"access": 4},
	{"access": 5}
] 
means this admin should have access to class, lecture, exams, invoice and bill features
where 
[
	{"access": 1},
	{"access": 2},
	{"access": 3},
	{"access": 4},
	{"access": 5},
	{"access": 6},
	{"access": 7}
] 
means this admin should have access to all features';
--ddl-end --

-- Append SQL commands --

INSERT INTO public.roles (id,name,privileges) VALUES
(0,'student/applicant','
[
	{"access": 0}
]
	'), 
(1,'staff','
[
	{"access": 1},
	{"access": 2},
	{"access": 3}
]
	'),
(2,'lecturer','
[
	{"access": 1},
	{"access": 2},
	{"access": 3},
	{"access": 4},
	{"access": 5}
]
	'),
(3,'admin','
[
	{"access": 1},
	{"access": 2},
	{"access": 3},
	{"access": 4},
	{"access": 5},
	{"access": 6},
	{"access": 7}
]
	'),
(4,'manager','
[
	{"access": 1},
	{"access": 2},
	{"access": 3},
	{"access": 4},
	{"access": 5},
	{"access": 6},
	{"access": 7},
	{"access": 8}
]
	'),
(5,'super','
[
	{"access": 1},
	{"access": 2},
	{"access": 3},
	{"access": 4},
	{"access": 5},
	{"access": 6},
	{"access": 7},
	{"access": 8},
	{"access": 9}
]
	')
	
	;




-- object: public.student_results | type: TABLE --
-- DROP TABLE IF EXISTS public.student_results CASCADE;
CREATE TABLE public.student_results(
	id bigserial NOT NULL,
	student_id bigint NOT NULL,
	course_id bigint NOT NULL,
	semester_id bigint NOT NULL,
	score smallint NOT NULL,
	grade varchar(2) NOT NULL,
	point numeric(3,2) NOT NULL,
	comment text NOT NULL,
	CONSTRAINT pk_student_result_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.student_results.point IS '70% and above = ''A'' or 5.00 Grade points, 60-69% = ''B'' or 4.00 Grade points, 50-59% = ''C'' or 3.00 Grade points, 45-49% = ''D'' or 2.00 Grade points, 40-44% = ''E'' or 1.00 Grade points, 0-39% = ''F'' or 0.00 Grade points ';
-- ddl-end --

-- Appended SQL commands --

INSERT INTO public.student_results 
(student_id,course_id,semester_id,score,grade,point, comment) VALUES

(2,1,3,50,'C',3.00, ''),
(2,2,3,70,'A',5.00, ''),
(2,3,3,60,'B',4.00, ''),
(2,4,3,60,'B',4.00, ''),
(2,5,3,60,'B',4.00, ''),
(2,6,3,74,'A',5.00, ''),
(2,7,3,70,'A',5.00, ''),
(2,8,3,77,'A',5.00, ''),


(3,1,3,40,'E',1.00, ''),
(3,2,3,77,'A',5.00, ''),
(3,3,3,39,'F',0.00, ''),
(3,4,3,70,'A',5.00, ''),
(3,5,3,60,'B',4.00, ''),
(3,6,3,46,'D',2.00, ''),
(3,7,3,70,'A',5.00, ''),
(3,8,3,77,'A',5.00, ''),


(2,9,4,90,'A',5.00, ''),
(2,10,4,75,'A',5.00, ''),
(2,11,4,85,'A',5.00, ''),
(2,12,4,60,'B',4.00, ''),
(2,13,4,50,'C',3.00, ''),
(2,14,4,75,'A',5.00, ''),
(2,15,4,75,'A',5.00, ''),
(2,16,4,70,'A',5.00, ''),


(3,9,4,90,'A',5.00, ''),
(3,10,4,35,'F',0.00, ''),
(3,11,4,85,'A',5.00, ''),
(3,12,4,37,'F',0.00, ''),
(3,13,4,70,'A',5.00, ''),
(3,14,4,65,'B',4.00, ''),
(3,15,4,45,'D',2.00, ''),
(3,16,4,70,'A',5.00, '')

;




-- ddl-end --

-- object: public.student_cgpas | type: TABLE --
-- DROP TABLE IF EXISTS public.student_cgpas CASCADE;
CREATE TABLE public.student_cgpas(
	id bigserial NOT NULL,
	student_id bigint NOT NULL,
	semester_id bigint NOT NULL,
	gpa numeric(5,2) NOT NULL,
	cgpa numeric(5,2) NOT NULL,
	CONSTRAINT pk_student_cgpa_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.student_cgpas IS 'Already the student_results table is actually meant to contain data  of registered courses';
-- ddl-end --
COMMENT ON COLUMN public.student_cgpas.gpa IS 'GPA = QP/CU';
-- ddl-end --
COMMENT ON COLUMN public.student_cgpas.cgpa IS 'CGPA = TQP/TCU';
-- ddl-end --

-- Appended SQL commands --

INSERT INTO public.student_cgpas (student_id,semester_id,gpa,cgpa) VALUES 
-- (2,3,4.55,4.55),
-- (3,3,3.73,3.73),

-- (2,4,4.55,4.48),
-- (3,4,3.90,3.81)

(2,3,4.38,4.38),
(3,3,2.75,2.75),

(2,4,4.63,4.50),
(3,4,3.25,3.00)
;
-- ddl-end --

-- object: public.student_invoices | type: TABLE --
-- DROP TABLE IF EXISTS public.student_invoices CASCADE;
CREATE TABLE public.student_invoices(
	id bigserial NOT NULL,
	invoice_bill_id bigint NOT NULL,
	session_id bigint NOT NULL,
	semester_id bigint NOT NULL,
	faculty_id bigint NOT NULL,
	dept_id bigint NOT NULL,
	program_id bigint NOT NULL,
	person_id integer NOT NULL,
	name varchar(70) NOT NULL,
	type_id smallint NOT NULL,
	issue_date date NOT NULL,
	due_date date NOT NULL,
	items json NOT NULL,
	amount numeric(15,2) NOT NULL,
	CONSTRAINT pk_invoice_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.student_invoices IS 'This is the invoice meant to be available for each student as a bill';
-- ddl-end --
-- COMMENT ON COLUMN public.student_invoices.type IS '0 - means applicant invoice, 1 - means student invoice';
-- -- ddl-end --

-- Appended SQL commands --

INSERT INTO public.student_invoices (invoice_bill_id,session_id,semester_id,faculty_id, dept_id, program_id,person_id,name,type_id,issue_date,due_date, items, amount) VALUES

(
	1,
	1,
	1,
	1,
	1,
	1,
	2,
	'Application Bill: 2015-2016',
	1,
	'2015-09-12', 
	'2016-02-23',
	'[
		{"name": "application-fee", "fee": 5000}
	]',
	5000
),

(
	2,
	2,
	3,
	1,
	1,
	1,
	3,
	'Application Bill: 2016-2017',
	1,
	'2016-09-12', 
	'2017-02-23',
	'[
		{"name": "application-fee", "fee": 5000}
	]',
	5000
),
(
	3,
	2,
	3,
	1,
	1,
	1,
	2,
	'Acceptance Bill: 2016-2017',
	2,
	'2016-09-12', 
	'2017-02-23',
	'[
		{"name": "acceptance", "fee": 36000}
	]',
	36000
),

(	
	4,
	2,
	3,
	1,
	1,
	1,
	2,
	'1st Semester Course Registration Bill: 2016-2017',
	3,
	'2016-09-12', 
	'2017-02-23', 
	'[
		{"name": "registration", "fee": 90000}
	]',
	90000
),
(	
	5,
	2,
	3,
	1,
	1,
	1,
	2,
	'1st Semester Tuition and Examination Bill: 2016-2017',
	4,
	'2016-09-12', 
	'2017-02-23', 
	'[
		{"name": "tuition-fee", "fee": 70000},
		{"name": "exam-fee", "fee": 60000}
	]',
	130000
),
(	
	6,
	2,
	3,
	1,
	1,
	1,
	2,
	'1st Semester Materials Bill: 2016-2017',
	5,
	'2016-09-12', 
	'2017-02-23', 
	'[
		{"name": "materials-fee", "fee": 10000}
	]',
	10000
),

(
	7,
	2,
	4,
	1,
	1,
	1,
	2,
	'2nd Semester Course Registration Bill: 2016-2017',
	3,
	'2017-03-12', 
	'2017-07-23', 
	'[
		{"name": "registration-fee", "fee": 90000}
	]',
	90000
),
(
	8,
	2,
	4,
	1,
	1,
	1,
	2,
	'2nd Semester Tuition and Examination Bill: 2016-2017',
	4,
	'2017-03-12', 
	'2017-07-23', 
	'[
		{"name": "tuition-fee", "fee": 70000},
		{"name": "exam-fee", "fee": 60000}
	]',
	130000
),
(
	9,
	2,
	4,
	1,
	1,
	1,
	2,
	'2nd Semester Materials Bill: 2016-2017',
	5,
	'2017-03-12', 
	'2017-07-23', 
	'[
		{"name": "materials-fee", "fee": 10000}
	]',
	10000
),
(
	10,
	3,
	5,
	1,
	1,
	1,
	4,
	'Application Bill: 2017-2018',
	1,
	'2017-09-12', 
	'2018-02-23', 
	'[
		{"name": "application-fee", "fee": 5000}
	]',
	5000
),

(
	11,
	3,
	5,
	1,
	1,
	1,
	3,
	'Acceptance Bill: 2017-2018',
	2,
	'2017-09-12', 
	'2018-02-23', 
	'[
		{"name": "acceptance-fee", "fee": 20000}
	]',
	20000
),

(
	12,
	3,
	5,
	1,
	1,
	1,
	2,
	'1st Semester Course Registration Bill: 2017-2018',
	3,
	'2017-09-12', 
	'2018-02-23',   
	'[
		{"name": "registration-fee", "fee": 90000}
	]',
	90000
),

(
	13,
	3,
	5,
	1,
	1,
	1,
	2,
	'1st Semester Tuition and Examination Bill: 2017-2018',
	4,
	'2017-09-12', 
	'2018-02-23',   
	'[
		{"name": "tuition-fee", "fee": 70000},
		{"name": "exam-fee", "fee": 60000}
	]',
	130000
),

(
	14,
	3,
	5,
	1,
	1,
	1,
	2,
	'1st Semester Materials Bill: 2017-2018',
	5,
	'2017-09-12', 
	'2018-02-23',   
	'[
		{"name": "materials-fee", "fee": 10000}
	]',
	10000
),

(
	15,
	3,
	6,
	1,
	1,
	1,
	2,
	'2nd Semester Course Registration Bill: 2017-2018',
	3,
	'2018-03-12', 
	'2018-07-23',   
	'[
		{"name": "registration-fee", "fee": 90000}
	]',
	90000
),

(
	16,
	3,
	6,
	1,
	1,
	1,
	2,
	'2nd Semester Tuition and Examination Bill: 2017-2018',
	4,
	'2018-03-12', 
	'2018-07-23',   
	'[
		{"name": "tuition-fee", "fee": 70000},
		{"name": "exam-fee", "fee": 60000}
	]',
	90000
),

(
	17,
	3,
	6,
	1,
	1,
	1,
	2,
	'2nd Semester Materials Bill: 2017-2018',
	5,
	'2018-03-12', 
	'2018-07-23',   
	'[
		{"name": "materials-fee", "fee": 10000}
	]',
	10000
),

(
	18,
	3,
	6,
	1,
	1,
	1,
	2,
	'Bill for riot: 2017-2018',
	6,
	'2018-03-12', 
	'2018-07-23',  
	'[
		{"name": "furniture-fee", "fee": 2000},
		{"name": "gadget-fee", "fee": 3000},
		{"name": "others-fee", "fee": 2000}
	]',
	7000
)


;

-- ddl-end --

-- object: public.invoice_bills | type: TABLE --
-- DROP TABLE IF EXISTS public.invoice_bills CASCADE;


CREATE TABLE public.invoice_bills(
	id bigserial NOT NULL,
	session_id bigint NOT NULL,
	semester_id bigint NOT NULL,
	faculty_id bigint NOT NULL,
	dept_id bigint NOT NULL,
	program_id bigint NOT NULL,
	name varchar(70) NOT NULL,
	status smallint NOT NULL,
	type_id smallint NOT NULL,
	issue_date date NOT NULL,
	due_date date NOT NULL, 
	items json NOT NULL,
	amount numeric(15,2) NOT NULL,
	CONSTRAINT pk_invoice_bill_id PRIMARY KEY (id)
);


-- ddl-end --
COMMENT ON TABLE public.invoice_bills IS 'This is the bill template';
-- ddl-end --
COMMENT ON COLUMN public.invoice_bills.status IS '1 - means pending, 2 - means finalised, 3 - means applied';
-- ddl-end --
COMMENT ON COLUMN public.invoice_bills.type_id IS '1 - Applicant Registration-fee, 2 - Acceptance-fee, 3 - Student Course Registration-fee, 4 - Examination-fee , 5 - Material-fee';
-- ddl-end --
COMMENT ON COLUMN public.invoice_bills.items IS 'to contain json format for items.';


-- Appended SQL commands --

INSERT INTO public.invoice_bills (session_id,semester_id,faculty_id,dept_id,program_id,name,status,type_id,issue_date,due_date,items,amount) VALUES 
(
	1,
	1,
	0,
	0,
	0,
	'Application Bill: 2015-2016',
	3,
	1,
	'2015-09-12', 
	'2016-02-23',
	'[
		{"name": "application-fee", "fee": 5000}
	]',
	5000
),
(
	1,
	1,
	0,
	0,
	0,
	'Acceptance Bill: 2015-2016',
	3,
	2,
	'2016-09-12', 
	'2017-02-23',
	'[
		{"name": "acceptance-fee", "fee": 36000}
	]',
	36000
),
(
	2,
	3,
	0,
	0,
	0,
	'Application Bill: 2016-2017',
	3,
	1,
	'2016-09-12', 
	'2017-02-23',
	'[
		{"name": "application-fee", "fee": 5000}
	]',
	5000
),
(
	2,
	3,
	0,
	0,
	0,
	'Acceptance Bill: 2016-2017',
	3,
	2,
	'2017-09-12', 
	'2018-02-23', 
	'[
		{"name": "acceptance-fee", "fee": 20000}
	]',
	20000
),

(	
	2,
	3,
	0,
	0,
	0,
	'1st Semester Course Registration Bill: 2016-2017',
	3,
	3,
	'2016-09-12', 
	'2017-02-23', 
	'[
		{"name": "registration-fee", "fee": 90000}
	]',
	90000
),
(	
	2,
	3,
	0,
	0,
	0,
	'1st Semester Tuition and Examination Bill: 2016-2017',
	3,
	4,
	'2016-09-12', 
	'2017-02-23', 
	'[
		
		{"name": "tuition-fee", "fee": 70000},
		{"name": "exam-fee", "fee": 60000}
	]',
	130000
),
(	
	2,
	3,
	0,
	0,
	0,
	'1st Semester Materials Bill: 2016-2017',
	3,
	5,
	'2016-09-12', 
	'2017-02-23', 
	'[
		
		{"name": "materials-fee", "fee": 10000}
	]',
	10000
),
(
	2,
	4,
	0,
	0,
	0,
	'2nd Semester Course Registration Bill: 2016-2017',
	3,
	3,
	'2017-03-12', 
	'2017-07-23', 
	'[
		{"name": "registration-fee", "fee": 90000}
	]',
	90000
),
(
	2,
	4,
	0,
	0,
	0,
	'2nd Semester Tuition and Examination Bill: 2016-2017',
	3,
	4,
	'2017-03-12', 
	'2017-07-23', 
	'[
		{"name": "tuition-fee", "fee": 70000},
		{"name": "exam-fee", "fee": 60000}
	]',
	130000
),
(
	2,
	4,
	0,
	0,
	0,
	'2nd Semester Materials Bill: 2016-2017',
	3,
	5,
	'2017-03-12', 
	'2017-07-23', 
	'[
		{"name": "materials-fee", "fee": 10000}
	]',
	10000
),
(
	3,
	5,
	0,
	0,
	0,
	'Application Bill: 2017-2018',
	3,
	1,
	'2017-09-12', 
	'2018-02-23', 
	'[
		{"name": "application-fee", "fee": 5000}
	]',
	5000
),

(
	3,
	5,
	0,
	0,
	0,
	'Acceptance Bill: 2017-2018',
	3,
	2,
	'2017-09-12', 
	'2018-02-23', 
	'[
		{"name": "acceptance-fee", "fee": 20000}
	]',
	20000
),

(
	3,
	5,
	0,
	0,
	0,
	'1st Semester Course Registration Bill: 2017-2018',
	3,
	3,
	'2017-09-12', 
	'2018-02-23',  
	'[
		{"name": "registration-fee", "fee": 90000}
	]',
	90000
),
(
	3,
	5,
	0,
	0,
	0,
	'1st Semester Tuition and Examination Bill: 2017-2018',
	3,
	4,
	'2017-09-12', 
	'2018-02-23',  
	'[

		{"name": "tuition-fee", "fee": 70000},
		{"name": "exam-fee", "fee": 60000}
	]',
	130000
),
(
	3,
	5,
	0,
	0,
	0,
	'1st Semester Materials Bill: 2017-2018',
	3,
	5,
	'2017-09-12', 
	'2018-02-23',  
	'[

		{"name": "materials-fee", "fee": 10000}
	]',
	10000
),
(
	3,
	6,
	0,
	0,
	0,
	'2nd Semester Course Registration Bill: 2017-2018',
	3,
	3,
	'2018-03-12', 
	'2018-07-23',  
	'[
		{"name": "registration-fee", "fee": 90000}
	]',
	90000
),
(
	3,
	6,
	0,
	0,
	0,
	'2nd Semester Tuition and Examination Bill: 2017-2018',
	3,
	4,
	'2018-03-12', 
	'2018-07-23',  
	'[

		{"name": "tuition-fee", "fee": 70000},
		{"name": "exam-fee", "fee": 60000}
	]',
	130000
),
(
	3,
	6,
	0,
	0,
	0,
	'2nd Semester Materials Bill: 2017-2018',
	3,
	5,
	'2018-03-12', 
	'2018-07-23',  
	'[

		{"name": "materials-fee", "fee": 10000}
	]',
	10000
),
(
	3,
	6,
	0,
	0,
	0,
	'Bill for riot: 2017-2018',
	3,
	6,
	'2018-03-12', 
	'2018-07-23',  
	'[
		{"name": "furniture-fee", "fee": 2000},
		{"name": "gadget-fee", "fee": 3000},
		{"name": "others-fee", "fee": 2000}
	]',
	7000
),
(
	4,
	0,
	0,
	0,
	0,
	'Application Bill: 2018-2019',
	3,
	1,
	'2018-09-12', 
	'2019-02-23',
	'[
		{"name": "application-fee", "fee": 20000}
	]',
	20000
),

(
	4,
	0,
	0,
	0,
	0,
	'Acceptance Bill: 2018-2019',
	3,
	2,
	'2018-09-12', 
	'2019-02-23',
	'[
		{"name": "acceptance-fee", "fee": 50000}
	]',
	50000
),

(
	4,
	7,
	0,
	0,
	0,
	'1st Semester Course Registration Bill: 2018-2019',
	3,
	3,
	'2017-09-12', 
	'2018-02-23',  
	'[
		{"name": "registration-fee", "fee": 100000}
	]',
	100000
),
(
	4,
	7,
	0,
	0,
	0,
	'1st Semester Tuition and Examination Bill: 2018-2019',
	3,
	4,
	'2017-09-12', 
	'2018-02-23',  
	'[

		{"name": "tuition-fee", "fee": 70000},
		{"name": "exam-fee", "fee": 70000}
	]',
	140000
),
(
	4,
	7,
	0,
	0,
	0,
	'1st Semester Materials Bill: 2018-2019',
	3,
	5,
	'2017-09-12', 
	'2018-02-23',  
	'[

		{"name": "materials-fee", "fee": 15000}
	]',
	15000
),
(
	4,
	8,
	0,
	0,
	0,
	'2nd Semester Course Registration Bill: 2018-2019',
	3,
	3,
	'2018-03-12', 
	'2018-07-23',  
	'[
		{"name": "registration-fee", "fee": 100000}
	]',
	100000
),
(
	4,
	8,
	0,
	0,
	0,
	'2nd Semester Tuition and Examination Bill: 2018-2019',
	3,
	4,
	'2018-03-12', 
	'2018-07-23',  
	'[

		{"name": "tuition-fee", "fee": 80000},
		{"name": "exam-fee", "fee": 80000}
	]',
	160000
),
(
	4,
	8,
	0,
	0,
	0,
	'2nd Semester Materials Bill: 2018-2019',
	3,
	5,
	'2018-03-12', 
	'2018-07-23',  
	'[

		{"name": "materials-fee", "fee": 17000}
	]',
	17000
)

;
-- ddl-end --


-- object: public.syllabus | type: TABLE --
-- DROP TABLE IF EXISTS public.syllabus CASCADE;
CREATE TABLE public.syllabus(
	id bigserial NOT NULL,
	program_id bigint NOT NULL,
	year smallint NOT NULL,
	semester_id bigint NOT NULL,
	course_id bigint NOT NULL,
	is_compulsory bool NOT NULL,
	CONSTRAINT pk_syllabus_id PRIMARY KEY (id)

);
-- ddl-end --

-- Appended SQL commands --


INSERT INTO public.syllabus 
(program_id,year,semester_id,course_id,is_compulsory) VALUES 

--100 level Business Management courses 2016-2017 session---
(1,1,3,1,true),
(1,1,3,2,true),
(1,1,3,3,true),
(1,1,3,4,true),
(1,1,3,5,true),
(1,1,3,6,true),
(1,1,3,7,true),
(1,1,3,8,true),

(1,1,4,9,true),
(1,1,4,10,true),
(1,1,4,11,true),
(1,1,4,12,true),
(1,1,4,13,true),
(1,1,4,14,true),
(1,1,4,15,true),
(1,1,4,16,true),

--200 level Business Management courses 2017-2018 session---
(1,2,5,343,true),
(1,2,5,344,true),
(1,2,5,345,true),

(1,2,6,346,true),
(1,2,6,347,true),
(1,2,6,348,true),

--300 level Business Management courses 2018-2019 session---
(1,3,7,349, true),
(1,3,7,350, true),
(1,3,7,351, true),
(1,3,7,17, true),
(1,3,7,18, true),

(1,3,8,352, true),
(1,3,8,353, true),
(1,3,8,354, true),
(1,3,8,19, true),
(1,3,8,20, true),

--400 level Business Management courses 2019-2020 session---
(1,4,9,355, true),
(1,4,9,356, true),
(1,4,9,21, true),

(1,4,10,357, true),
(1,4,10,358, true),

--500 level Business Management courses 2020-2021 session---
(1,5,11,313, true),
(1,5,11,314, true),
(1,5,11,315, true),
(1,5,11,316, true),
(1,5,11,319, true),

(1,5,12,320, true),
(1,5,12,321, true),
(1,5,12,332, true),
(1,5,12,341, true),


--100 level Economics courses 2016-2017 session---
(3,1,3,1,true),
(3,1,3,2,true),
(3,1,3,3,true),
(3,1,3,4,true),
(3,1,3,5,true),
(3,1,3,6,true),
(3,1,3,7,true),
(3,1,3,8,true),

(3,1,4,9,true),
(3,1,4,10,true),
(3,1,4,11,true),
(3,1,4,12,true),
(3,1,4,13,true),
(3,1,4,14,true),
(3,1,4,15,true),
(3,1,4,16,true),

--200 level Economics courses 2017-2018 session---
(3,2,5,301,true),
(3,2,5,302,true),
(3,2,5,303,true),
(3,2,5,304,true),

(3,2,6,305,true),
(3,2,6,306,true),
(3,2,6,307,true),
(3,2,6,308,true),


--300 level Economics courses 2018-2019 session
(3,3,7,309,true),
(3,3,7,310,true),
(3,3,7,311,true),
(3,3,7,312,true),
(3,3,7,313,true),

(3,3,8,314,true),
(3,3,8,315,true),
(3,3,8,316,true),
(3,3,8,317,true),
(3,3,8,318,true),


-- For Economics 400 level 2019-2020 session---
(3,4,9,322,true),
(3,4,9,323,true),
(3,4,9,324,true),
(3,4,9,325,true),
(3,4,9,326,true),

(3,4,10,327,true),
(3,4,10,328,true),
(3,4,10,329,true),
(3,4,10,330,true),
(3,4,10,331,true),

-- For Economics 500 level 2020-2021 session---
(3,5,11,333,true),
(3,5,11,334,true),
(3,5,11,335,true),
(3,5,11,336,true),

(3,5,12,337,true),
(3,5,12,338,true),
(3,5,12,339,true),
(3,5,12,340,true),

-- Creating courses for 2017-2018 session --- Business Management and ECO courses

--100 level Business Management courses 2017-2018 session
(1,1,5,1,true),
(1,1,5,2,true),
(1,1,5,3,true),
(1,1,5,4,true),
(1,1,5,5,true),
(1,1,5,6,true),
(1,1,5,7,true),
(1,1,5,8,true),

(1,1,6,9,true),
(1,1,6,10,true),
(1,1,6,11,true),
(1,1,6,12,true),
(1,1,6,13,true),
(1,1,6,14,true),
(1,1,6,15,true),
(1,1,6,16,true),


--100 level Economics courses 2017-2018 session
(3,1,5,1,true),
(3,1,5,2,true),
(3,1,5,3,true),
(3,1,5,4,true),
(3,1,5,5,true),
(3,1,5,6,true),
(3,1,5,7,true),
(3,1,5,8,true),

(3,1,6,9,true),
(3,1,6,10,true),
(3,1,6,11,true),
(3,1,6,12,true),
(3,1,6,13,true),
(3,1,6,14,true),
(3,1,6,15,true),
(3,1,6,16,true),

-- Creating courses for 2018-2019 session --- Business Management and ECO courses

--100 level Business Management courses 2018-2019 session
(1,1,7,1,true),
(1,1,7,2,true),
(1,1,7,3,true),
(1,1,7,4,true),
(1,1,7,5,true),
(1,1,7,6,true),
(1,1,7,7,true),
(1,1,7,8,true),

(1,1,8,9,true),
(1,1,8,10,true),
(1,1,8,11,true),
(1,1,8,12,true),
(1,1,8,13,true),
(1,1,8,14,true),
(1,1,8,15,true),
(1,1,8,16,true),


--100 level Economics courses 2018-2019 session
(3,1,7,1,true),
(3,1,7,2,true),
(3,1,7,3,true),
(3,1,7,4,true),
(3,1,7,5,true),
(3,1,7,6,true),
(3,1,7,7,true),
(3,1,7,8,true),

(3,1,8,9,true),
(3,1,8,10,true),
(3,1,8,11,true),
(3,1,8,12,true),
(3,1,8,13,true),
(3,1,8,14,true),
(3,1,8,15,true),
(3,1,8,16,true),


--200 level Business Management courses 2018-2019 session
(1,2,7,343,true),
(1,2,7,344,true),
(1,2,7,345,true),

(1,2,8,346,true),
(1,2,8,347,true),
(1,2,8,348,true),

--200 level Economics courses 2018-2019 session
(3,2,7,301,true),
(3,2,7,302,true),
(3,2,7,303,true),
(3,2,7,304,true),

(3,2,8,305,true),
(3,2,8,306,true),
(3,2,8,307,true),
(3,2,8,308,true),

-- -- For Business Management 300 level 2018-2019 session---
-- (1,3,7,349, true),
-- (1,3,7,350, true),
-- (1,3,7,351, true),
-- (1,3,7,17, true),
-- (1,3,7,18, true),

-- (1,3,8,352, true),
-- (1,3,8,353, true),
-- (1,3,8,354, true),
-- (1,3,8,19, true),
-- (1,3,8,20, true),

-- -- For Economics 300 level 2018-2019 session---
-- (3,3,7,309,true),
-- (3,3,7,310,true),
-- (3,3,7,311,true),
-- (3,3,7,312,true),
-- (3,3,7,313,true),

-- (3,3,8,314,true),
-- (3,3,8,315,true),
-- (3,3,8,316,true),
-- (3,3,8,317,true),
-- (3,3,8,318,true),


--400 level Business Management courses 2018-2019 session
(1,4,7,355, true),
(1,4,7,356, true),
(1,4,7,21, true),

(1,4,8,357, true),
(1,4,8,358, true),


--400 level Economics courses 2018-2019 session
(3,4,7,322,true),
(3,4,7,323,true),
(3,4,7,324,true),
(3,4,7,325,true),
(3,4,7,326,true),

(3,4,8,327,true),
(3,4,8,328,true),
(3,4,8,329,true),
(3,4,8,330,true),
(3,4,8,331,true),

--500 level Business Management courses 2018-2019 session
(1,5,7,313, true),
(1,5,7,314, true),
(1,5,7,315, true),
(1,5,7,316, true),
(1,5,7,319, true),

(1,5,8,320, true),
(1,5,8,321, true),
(1,5,8,332, true),
(1,5,8,341, true),


--500 level Economics courses 2018-2019 session
(3,5,7,333,true),
(3,5,7,334,true),
(3,5,7,335,true),
(3,5,7,336,true),

(3,5,8,337,true),
(3,5,8,338,true),
(3,5,8,339,true),
(3,5,8,340,true)


;

-- ddl-end --

-- object: public.academic_calendars | type: TABLE --
-- DROP TABLE IF EXISTS public.academic_calendars CASCADE;
CREATE TABLE public.academic_calendars(
	id bigserial NOT NULL,
	session_id bigint NOT NULL,
	type integer NOT NULL,
	classification integer NOT NULL,
	title text NOT NULL,
	description text NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	CONSTRAINT pk_academic_calendar_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.academic_calendars.type IS '1 for examination and 2 for others';
-- ddl-end --
COMMENT ON COLUMN public.academic_calendars.classification IS '1 for general, 2 for level, 3 for courses';
-- ddl-end --
COMMENT ON COLUMN public.academic_calendars.description IS 'to describe the activity on this day, period';
-- ddl-end --
COMMENT ON COLUMN public.academic_calendars.start_date IS 'the starting date of the described activity';
-- ddl-end --
COMMENT ON COLUMN public.academic_calendars.end_date IS 'the ending date of the described activity';
-- ddl-end --

-- Appended SQL commands --

INSERT INTO public.academic_calendars 
(session_id,type,classification,title,description,start_date,end_date) VALUES 
(2,2,1,'science workshop','This is a compulsory workshop for all science students','2017-01-12','2017-01-13'),
(2,2,1,'technology workshop','This is a compulsory workshop for all technology students','2017-08-12','2017-08-13'),
(3,2,1,'engineering workshop','This is a compulsory workshop for all engineering students','2018-01-12','2018-01-13'),
(3,2,1,'innovation fair','This is a compulsory student-fair for all students','2018-08-15','2018-08-17')
;
-- ddl-end --

-- object: public.announcements | type: TABLE --
-- DROP TABLE IF EXISTS public.announcements CASCADE;
CREATE TABLE public.announcements(
	id bigserial NOT NULL,
	session_id bigint NOT NULL,
	type integer NOT NULL,
	title varchar(80) NOT NULL,
	description text NOT NULL,
	date timestamp NOT NULL DEFAULT LOCALTIMESTAMP,
	CONSTRAINT pk_announcement_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.announcements.type IS '1 for general, 2 for students, 3 for staff';
-- ddl-end --


-- Appended SQL commands --
INSERT INTO public.announcements (session_id,type,title,description,date) VALUES 
(3,2,'Fellowship Time','Go and fellowship with all ....', '2018-07-23'),
(3,2,'Prayer Time','Go and Pray to our Father in heaven ....', '2018-09-21')
;
-- ddl-end --

-- object: public.exam_schedules | type: TABLE --
-- DROP TABLE IF EXISTS public.exam_schedules CASCADE;
CREATE TABLE public.exam_schedules(
	id bigserial NOT NULL,
	exam_id bigint NOT NULL,
	exam_no varchar(12) NOT NULL,
	semester_id bigint NOT NULL,
	course_id bigint NOT NULL,
	description text NOT NULL,
	location varchar(100) NOT NULL,
	date date NOT NULL,
	start_time time NOT NULL,
	end_time time NOT NULL,
	result_status smallint NOT NULL,
	CONSTRAINT pk_exam_schedule_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.exam_schedules.semester_id IS 'semester entry';
-- ddl-end --
COMMENT ON COLUMN public.exam_schedules.result_status IS 'determines whether the exam is 1 - undrafted, 2 - drafted, 3 - finalized';

-- Appended SQL commands --


INSERT INTO public.exam_schedules 
(exam_id,exam_no,semester_id,course_id,description,location, date,start_time,end_time, result_status) VALUES 
(1,'GNS324',3,1,'Take note of your exam venue and be punctual','Hall A','2017-01-12','09:00:00', '10:00:00', 3),
(1,'GNS325',3,2,'Take note of your exam venue and be punctual','Hall B','2017-01-12','13:00:00', '14:00:00', 3),
(1,'GNS326',3,3,'Take note of your exam venue and be punctual','Hall A','2017-01-13','09:00:00', '10:00:00', 3),
(1,'GNS327',3,4,'Take note of your exam venue and be punctual','Hall B','2017-01-13','13:00:00', '14:00:00', 3),
(1,'GNS328',3,5,'Take note of your exam venue and be punctual','Hall A','2017-01-15','09:00:00', '10:00:00', 3),
(1,'GNS329',3,6,'Take note of your exam venue and be punctual','Hall B','2017-01-16','13:00:00', '14:00:00', 3),
(1,'GNS330',3,7,'Take note of your exam venue and be punctual','Hall A','2017-01-18','13:00:00', '14:00:00', 3),
(1,'GNS331',3,8,'Take note of your exam venue and be punctual','Hall B','2017-01-19','09:00:00', '10:00:00', 3),

(2,'GNS332',3,9,'Take note of your exam venue and be punctual','Hall A','2017-01-20','13:00:00', '14:00:00', 3),
(2,'GNS333',3,10,'Take note of your exam venue and be punctual','Hall B','2017-01-21','13:00:00', '14:00:00', 3),
(2,'GNS334',3,11,'Take note of your exam venue and be punctual','Hall A','2017-01-22','09:00:00', '10:00:00', 3),
(2,'GNS335',4,12,'Take note of your exam venue and be punctual','Hall A','2017-08-12','09:00:00', '10:00:00', 3),
(2,'GNS336',4,13,'Take note of your exam venue and be punctual','Hall B','2017-08-12','13:00:00', '14:00:00', 3),
(2,'GNS337',4,14,'Take note of your exam venue and be punctual','Hall A','2017-08-13','09:00:00', '10:00:00', 3),
(2,'GNS338',4,15,'Take note of your exam venue and be punctual','Hall B','2017-08-13','13:00:00', '14:00:00', 3),
(2,'GNS339',4,16,'Take note of your exam venue and be punctual','Hall A','2017-08-16','09:00:00', '10:00:00', 3)

;

-- ddl-end --

-- object: public.exams | type: TABLE --
-- DROP TABLE IF EXISTS public.exams CASCADE;
CREATE TABLE public.exams(
	id bigserial NOT NULL,
	session_id bigint NOT NULL,
	semester_id smallint NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	CONSTRAINT pk_exam_id PRIMARY KEY (id)

);
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.exams (session_id,semester_id,start_date,end_date) VALUES 
(1,3,'2017-01-12','2017-02-23'),
(1,4,'2017-01-12','2017-02-23')

;
-- ddl-end --

-- object: public.items | type: TABLE --
-- DROP TABLE IF EXISTS public.items CASCADE;
-- CREATE TABLE public.items(
-- 	id bigserial NOT NULL,
-- 	invoice_id bigint NOT NULL,
-- 	payment_type integer NOT NULL,
-- 	amount numeric(15,2) NOT NULL,
-- 	CONSTRAINT pk_item_id PRIMARY KEY (id)

-- );
-- -- ddl-end --
-- COMMENT ON COLUMN public.items.payment_type IS '1 - application-fee, 2 - acceptance-fee, 3 - registration-fee, 4 - tuition & exam-fee, 5 - materials-fee.';
-- -- ddl-end --

-- -- Appended SQL commands --

-- INSERT INTO public.items (invoice_id,payment_type,amount) VALUES 
-- (1,0,5000),

-- (2,0,5000),

-- (3,1,36000),
-- (4,2,90000),
-- (4,3,70000),
-- (4,4,60000),
-- (4,5,10000),


-- (5,2,90000),
-- (5,3,70000),
-- (5,4,60000),
-- (5,5,10000),


-- (6,0,5000),

-- (7,1,36000),


-- (8,2,90000),
-- (8,3,70000),
-- (8,4,60000),
-- (8,5,10000),


-- (9,2,90000),
-- (9,3,70000),
-- (9,4,60000),
-- (9,5,10000)


-- ;

-- ddl-end --

-- object: public.matric_counts | type: TABLE --
-- DROP TABLE IF EXISTS public.matric_counts CASCADE;
CREATE TABLE public.matric_counts(
	id bigserial NOT NULL,
	type integer NOT NULL,
	dept_id bigint NOT NULL,
	counter bigint NOT NULL,
	CONSTRAINT pk_matric_count_id PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.matric_counts.type IS ' 1 - for Bsc, 2 - for Msc, 3 - for Phd';
-- ddl-end --
COMMENT ON COLUMN public.matric_counts.dept_id IS 'The source id ';
-- ddl-end --
COMMENT ON COLUMN public.matric_counts.counter IS 'matric no counter for each program type';
-- ddl-end --

-- Appended SQL commands --
INSERT INTO public.matric_counts (type,dept_id,counter) VALUES 
(1,1,2),
(1,2,0),
(1,3,2),
(1,4,0),
(1,5,0)



;
-- ddl-end --

-- object: fk_student_program_id | type: CONSTRAINT --
-- ALTER TABLE public.students DROP CONSTRAINT IF EXISTS fk_student_program_id CASCADE;
ALTER TABLE public.students ADD CONSTRAINT fk_student_program_id FOREIGN KEY (program_id)
REFERENCES public.programs (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_student_student_current_session_id | type: CONSTRAINT --
-- ALTER TABLE public.student_current_session_id DROP CONSTRAINT IF EXISTS fk_student_student_current_session_id CASCADE;
ALTER TABLE public.students ADD CONSTRAINT fk_student_student_current_session_id FOREIGN KEY (student_current_session_id)
REFERENCES public.academic_sessions (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_courses_department_id | type: CONSTRAINT --
-- ALTER TABLE public.courses DROP CONSTRAINT IF EXISTS fk_courses_department_id CASCADE;
ALTER TABLE public.courses ADD CONSTRAINT fk_courses_department_id FOREIGN KEY (department_id)
REFERENCES public.departments (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_department_faculty_id | type: CONSTRAINT --
-- ALTER TABLE public.departments DROP CONSTRAINT IF EXISTS fk_department_faculty_id CASCADE;
ALTER TABLE public.departments ADD CONSTRAINT fk_department_faculty_id FOREIGN KEY (faculty_id)
REFERENCES public.faculties (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_applicant_program_type_id | type: CONSTRAINT --
-- ALTER TABLE public.applicants DROP CONSTRAINT IF EXISTS fk_applicant_program_type_id CASCADE;
ALTER TABLE public.applicants ADD CONSTRAINT fk_applicant_program_type_id FOREIGN KEY (program_type_id)
REFERENCES public.programs (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_applicant_session_id | type: CONSTRAINT --
-- ALTER TABLE public.applicants DROP CONSTRAINT IF EXISTS fk_applicant_session_id CASCADE;
ALTER TABLE public.applicants ADD CONSTRAINT fk_applicant_session_id FOREIGN KEY (session_id)
REFERENCES public.academic_sessions (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_applicant_exam_applicant_id | type: CONSTRAINT --
-- ALTER TABLE public.applicant_exams DROP CONSTRAINT IF EXISTS fk_applicant_exam_applicant_id CASCADE;
ALTER TABLE public.applicant_exams ADD CONSTRAINT fk_applicant_exam_applicant_id FOREIGN KEY (applicant_id)
REFERENCES public.applicants (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_applicant_diploma_applicant_id | type: CONSTRAINT --
-- ALTER TABLE public.applicant_diplomas DROP CONSTRAINT IF EXISTS fk_applicant_diploma_applicant_id CASCADE;
ALTER TABLE public.applicant_diplomas ADD CONSTRAINT fk_applicant_diploma_applicant_id FOREIGN KEY (applicant_id)
REFERENCES public.applicants (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_program_dept_id | type: CONSTRAINT --
-- ALTER TABLE public.programs DROP CONSTRAINT IF EXISTS fk_program_dept_id CASCADE;
ALTER TABLE public.programs ADD CONSTRAINT fk_program_dept_id FOREIGN KEY (dept_id)
REFERENCES public.departments (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_password_table_person_id | type: CONSTRAINT --
-- ALTER TABLE public.password_tables DROP CONSTRAINT IF EXISTS fk_admission_applicant_id CASCADE;
ALTER TABLE public.secrets ADD CONSTRAINT fk_secrets_person_id FOREIGN KEY (person_id)
REFERENCES public.persons (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_admission_applicant_id | type: CONSTRAINT --
-- ALTER TABLE public.admissions DROP CONSTRAINT IF EXISTS fk_admission_applicant_id CASCADE;
ALTER TABLE public.admissions ADD CONSTRAINT fk_admission_applicant_id FOREIGN KEY (applicant_id)
REFERENCES public.applicants (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_person_state_id | type: CONSTRAINT --
-- ALTER TABLE public.persons DROP CONSTRAINT IF EXISTS fk_person_state_id CASCADE;
ALTER TABLE public.persons ADD CONSTRAINT fk_person_state_id FOREIGN KEY (state_id)
REFERENCES public.states (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_person_lga_id | type: CONSTRAINT --
-- ALTER TABLE public.persons DROP CONSTRAINT IF EXISTS fk_person_lga_id CASCADE;
ALTER TABLE public.persons ADD CONSTRAINT fk_person_lga_id FOREIGN KEY (lga_id)
REFERENCES public.lgas (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_person_nationality_id | type: CONSTRAINT --
-- ALTER TABLE public.persons DROP CONSTRAINT IF EXISTS fk_person_nationality_id CASCADE;
ALTER TABLE public.persons ADD CONSTRAINT fk_person_nationality_id FOREIGN KEY (nationality_id)
REFERENCES public.nationalities (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_person_religion_id | type: CONSTRAINT --
-- ALTER TABLE public.persons DROP CONSTRAINT IF EXISTS fk_person_religion_id CASCADE;
ALTER TABLE public.persons ADD CONSTRAINT fk_person_religion_id FOREIGN KEY (religion_id)
REFERENCES public.religions (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_applicant_exam_subject_id | type: CONSTRAINT --
-- ALTER TABLE public.applicant_exam_results DROP CONSTRAINT IF EXISTS fk_applicant_exam_subject_id CASCADE;
ALTER TABLE public.applicant_exam_results ADD CONSTRAINT fk_applicant_exam_subject_id FOREIGN KEY (subject_id)
REFERENCES public.subjects (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_applicant_exam_result_applicant_exam_id | type: CONSTRAINT --
-- ALTER TABLE public.applicant_exam_results DROP CONSTRAINT IF EXISTS fk_applicant_exam_result_applicant_exam_id CASCADE;
ALTER TABLE public.applicant_exam_results ADD CONSTRAINT fk_applicant_exam_result_applicant_exam_id FOREIGN KEY (applicant_exam_id)
REFERENCES public.applicant_exams (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_applicant_referee_applicant_id | type: CONSTRAINT --
-- ALTER TABLE public.applicant_referees DROP CONSTRAINT IF EXISTS fk_applicant_referee_applicant_id CASCADE;
ALTER TABLE public.applicant_referees ADD CONSTRAINT fk_applicant_referee_applicant_id FOREIGN KEY (applicant_id)
REFERENCES public.applicants (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_lga_state_id | type: CONSTRAINT --
-- ALTER TABLE public.lgas DROP CONSTRAINT IF EXISTS fk_lga_state_id CASCADE;
ALTER TABLE public.lgas ADD CONSTRAINT fk_lga_state_id FOREIGN KEY (state_id)
REFERENCES public.states (id) MATCH FULL
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_transaction_upload_id | type: CONSTRAINT --
-- ALTER TABLE public.transactions DROP CONSTRAINT IF EXISTS fk_transaction_upload_id CASCADE;
ALTER TABLE public.transactions ADD CONSTRAINT fk_transaction_upload_id FOREIGN KEY (upload_id)
REFERENCES public.uploads (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_payment_transaction_id | type: CONSTRAINT --
-- ALTER TABLE public.payments DROP CONSTRAINT IF EXISTS fk_payment_transaction_id CASCADE;
ALTER TABLE public.payments ADD CONSTRAINT fk_payment_transaction_id FOREIGN KEY (transaction_id)
REFERENCES public.transactions (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_payment_invoice_id | type: CONSTRAINT --
-- ALTER TABLE public.payments DROP CONSTRAINT IF EXISTS fk_payment_invoice_id CASCADE;
ALTER TABLE public.payments ADD CONSTRAINT fk_payment_invoice_bill_id FOREIGN KEY (invoice_bill_id)
REFERENCES public.invoice_bills (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_payment_payment_mode_id | type: CONSTRAINT --
-- ALTER TABLE public.payments DROP CONSTRAINT IF EXISTS fk_payment_payment_mode_id CASCADE;
ALTER TABLE public.payments ADD CONSTRAINT fk_payment_payment_mode_id FOREIGN KEY (payment_mode_id)
REFERENCES public.payment_modes (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_payment_person_id | type: CONSTRAINT --
-- ALTER TABLE public.payments DROP CONSTRAINT IF EXISTS fk_payment_person_id CASCADE;
-- ALTER TABLE public.payments ADD CONSTRAINT fk_payment_person_id FOREIGN KEY (person_id)
-- REFERENCES public.persons (id) MATCH FULL
-- ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_registration_student_id | type: CONSTRAINT --
-- ALTER TABLE public.registrations DROP CONSTRAINT IF EXISTS fk_registration_student_id CASCADE;
ALTER TABLE public.registrations ADD CONSTRAINT fk_registration_student_id FOREIGN KEY (student_id)
REFERENCES public.students (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_applicant_upload_upload_id | type: CONSTRAINT --
-- ALTER TABLE public.applicant_uploads DROP CONSTRAINT IF EXISTS fk_applicant_upload_upload_id CASCADE;
ALTER TABLE public.applicant_uploads ADD CONSTRAINT fk_applicant_upload_upload_id FOREIGN KEY (upload_id)
REFERENCES public.uploads (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_semester_registration_student_id | type: CONSTRAINT --
-- ALTER TABLE public.semester_registrations DROP CONSTRAINT IF EXISTS fk_semester_registration_student_id CASCADE;
ALTER TABLE public.semester_registrations ADD CONSTRAINT fk_semester_registration_student_id FOREIGN KEY (student_id)
REFERENCES public.students (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_semester_registration_semester_id | type: CONSTRAINT --
-- ALTER TABLE public.semester_registrations DROP CONSTRAINT IF EXISTS fk_semester_registration_semester_id CASCADE;
ALTER TABLE public.semester_registrations ADD CONSTRAINT fk_semester_registration_semester_id FOREIGN KEY (semester_id)
REFERENCES public.semesters (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_semester_session_id | type: CONSTRAINT --
-- ALTER TABLE public.semesters DROP CONSTRAINT IF EXISTS fk_semester_session_id CASCADE;
ALTER TABLE public.semesters ADD CONSTRAINT fk_semester_session_id FOREIGN KEY (session_id)
REFERENCES public.academic_sessions (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_semester_course_semester_id | type: CONSTRAINT --
-- ALTER TABLE public.semester_courses DROP CONSTRAINT IF EXISTS fk_semester_course_semester_id CASCADE;
ALTER TABLE public.semester_courses ADD CONSTRAINT fk_semester_course_semester_id FOREIGN KEY (semester_id)
REFERENCES public.semesters (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_semester_course_student_id | type: CONSTRAINT --
-- ALTER TABLE public.semester_courses DROP CONSTRAINT IF EXISTS fk_semester_course_student_id CASCADE;
ALTER TABLE public.semester_courses ADD CONSTRAINT fk_semester_course_student_id FOREIGN KEY (student_id)
REFERENCES public.students (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_semester_course_course_id | type: CONSTRAINT --
-- ALTER TABLE public.semester_courses DROP CONSTRAINT IF EXISTS fk_semester_course_course_id CASCADE;
ALTER TABLE public.semester_courses ADD CONSTRAINT fk_semester_course_course_id FOREIGN KEY (course_id)
REFERENCES public.courses (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_authentication_person_id | type: CONSTRAINT --
-- ALTER TABLE public.authentications DROP CONSTRAINT IF EXISTS fk_authentication_person_id CASCADE;
ALTER TABLE public.authentications ADD CONSTRAINT fk_authentication_person_id FOREIGN KEY (person_id)
REFERENCES public.persons (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_authentication_roles_id | type: CONSTRAINT --
-- ALTER TABLE public.authentications DROP CONSTRAINT IF EXISTS fk_authentication_person_id CASCADE;
ALTER TABLE public.authentications ADD CONSTRAINT fk_authentication_roles_id FOREIGN KEY (staff_role)
REFERENCES public.roles (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_student_result_student_id | type: CONSTRAINT --
-- ALTER TABLE public.student_results DROP CONSTRAINT IF EXISTS fk_student_result_student_id CASCADE;
ALTER TABLE public.student_results ADD CONSTRAINT fk_student_result_student_id FOREIGN KEY (student_id)
REFERENCES public.students (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_student_result_course_id | type: CONSTRAINT --
-- ALTER TABLE public.student_results DROP CONSTRAINT IF EXISTS fk_student_result_course_id CASCADE;
ALTER TABLE public.student_results ADD CONSTRAINT fk_student_result_course_id FOREIGN KEY (course_id)
REFERENCES public.courses (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_student_result_semester_id | type: CONSTRAINT --
-- ALTER TABLE public.student_results DROP CONSTRAINT IF EXISTS fk_student_result_semester_id CASCADE;
ALTER TABLE public.student_results ADD CONSTRAINT fk_student_result_semester_id FOREIGN KEY (semester_id)
REFERENCES public.semesters (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_student_cgpa_student_id | type: CONSTRAINT --
-- ALTER TABLE public.student_cgpas DROP CONSTRAINT IF EXISTS fk_student_cgpa_student_id CASCADE;
ALTER TABLE public.student_cgpas ADD CONSTRAINT fk_student_cgpa_student_id FOREIGN KEY (student_id)
REFERENCES public.students (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_student_cgpa_semester_id | type: CONSTRAINT --
-- ALTER TABLE public.student_cgpas DROP CONSTRAINT IF EXISTS fk_student_cgpa_semester_id CASCADE;
ALTER TABLE public.student_cgpas ADD CONSTRAINT fk_student_cgpa_semester_id FOREIGN KEY (semester_id)
REFERENCES public.semesters (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_student_invoice_bill_id | type: CONSTRAINT --
-- ALTER TABLE public.student_invoices DROP CONSTRAINT IF EXISTS fk_invoice_program_id CASCADE;
ALTER TABLE public.student_invoices ADD CONSTRAINT fk_student_invoice_bill_id FOREIGN KEY (invoice_bill_id)
REFERENCES public.invoice_bills (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_student_invoice_session_id | type: CONSTRAINT --
-- ALTER TABLE public.student_invoices DROP CONSTRAINT IF EXISTS fk_invoice_program_id CASCADE;
ALTER TABLE public.student_invoices ADD CONSTRAINT fk_student_invoice_session_id FOREIGN KEY (session_id)
REFERENCES public.academic_sessions (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_invoice_semester_id | type: CONSTRAINT --
-- ALTER TABLE public.student_invoices DROP CONSTRAINT IF EXISTS fk_invoice_session_id CASCADE;
ALTER TABLE public.student_invoices ADD CONSTRAINT fk_invoice_semester_id FOREIGN KEY (semester_id)
REFERENCES public.semesters (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_student_invoice_faculty_id | type: CONSTRAINT --
-- ALTER TABLE public.student_invoices DROP CONSTRAINT IF EXISTS fk_invoice_program_id CASCADE;
ALTER TABLE public.student_invoices ADD CONSTRAINT fk_student_invoice_faculty_id FOREIGN KEY (faculty_id)
REFERENCES public.faculties (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_student_invoice_dept_id | type: CONSTRAINT --
-- ALTER TABLE public.student_invoices DROP CONSTRAINT IF EXISTS fk_invoice_program_id CASCADE;
ALTER TABLE public.student_invoices ADD CONSTRAINT fk_student_invoice_dept_id FOREIGN KEY (dept_id)
REFERENCES public.departments (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_student_invoice_program_id | type: CONSTRAINT --
-- ALTER TABLE public.student_invoices DROP CONSTRAINT IF EXISTS fk_invoice_program_id CASCADE;
ALTER TABLE public.student_invoices ADD CONSTRAINT fk_student_invoice_program_id FOREIGN KEY (program_id)
REFERENCES public.programs (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_student_invoice_person_id | type: CONSTRAINT --
-- ALTER TABLE public.student_invoices DROP CONSTRAINT IF EXISTS fk_invoice_program_id CASCADE;
ALTER TABLE public.student_invoices ADD CONSTRAINT fk_student_invoice_person_id FOREIGN KEY (person_id)
REFERENCES public.persons (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_invoice_bill_session_id | type: CONSTRAINT --
-- ALTER TABLE public.invoice_bills DROP CONSTRAINT IF EXISTS fk_invoice_program_id CASCADE;
ALTER TABLE public.invoice_bills ADD CONSTRAINT fk_invoice_bill_session_id FOREIGN KEY (session_id)
REFERENCES public.academic_sessions (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_invoice_bill_semester_id | type: CONSTRAINT --
-- ALTER TABLE public.invoice_bills DROP CONSTRAINT IF EXISTS fk_invoice_program_id CASCADE;
-- ALTER TABLE public.invoice_bills ADD CONSTRAINT fk_invoice_bill_semester_id FOREIGN KEY (semester_id)
-- REFERENCES public.semesters (id) MATCH FULL
-- ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_invoice_bill_semester_id | type: CONSTRAINT --
-- ALTER TABLE public.invoice_bills DROP CONSTRAINT IF EXISTS fk_invoice_program_id CASCADE;
-- ALTER TABLE public.invoice_bills ADD CONSTRAINT fk_invoice_bill_faculty_id FOREIGN KEY (faculty_id)
-- REFERENCES public.faculties (id) MATCH FULL
-- ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_invoice_bill_semester_id | type: CONSTRAINT --
-- ALTER TABLE public.invoice_bills DROP CONSTRAINT IF EXISTS fk_invoice_program_id CASCADE;
-- ALTER TABLE public.invoice_bills ADD CONSTRAINT fk_invoice_bill_dept_id FOREIGN KEY (dept_id)
-- REFERENCES public.departments (id) MATCH FULL
-- ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_invoice_bill_semester_id | type: CONSTRAINT --
-- ALTER TABLE public.invoice_bills DROP CONSTRAINT IF EXISTS fk_invoice_program_id CASCADE;
-- ALTER TABLE public.invoice_bills ADD CONSTRAINT fk_invoice_bill_program_id FOREIGN KEY (program_id)
-- REFERENCES public.programs (id) MATCH FULL
-- ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_syllabus_program_id | type: CONSTRAINT --
-- ALTER TABLE public.syllabus DROP CONSTRAINT IF EXISTS fk_syllabus_program_id CASCADE;
ALTER TABLE public.syllabus ADD CONSTRAINT fk_syllabus_program_id FOREIGN KEY (program_id)
REFERENCES public.programs (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_syllabus_semester_id | type: CONSTRAINT --
-- ALTER TABLE public.syllabus DROP CONSTRAINT IF EXISTS fk_syllabus_semester_id CASCADE;
ALTER TABLE public.syllabus ADD CONSTRAINT fk_syllabus_semester_id FOREIGN KEY (semester_id)
REFERENCES public.semesters (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_syllabus_course_id | type: CONSTRAINT --
-- ALTER TABLE public.syllabus DROP CONSTRAINT IF EXISTS fk_syllabus_course_id CASCADE;
ALTER TABLE public.syllabus ADD CONSTRAINT fk_syllabus_course_id FOREIGN KEY (course_id)
REFERENCES public.courses (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_academic_calendar_session_id | type: CONSTRAINT --
-- ALTER TABLE public.academic_calendars DROP CONSTRAINT IF EXISTS fk_academic_calendar_session_id CASCADE;
ALTER TABLE public.academic_calendars ADD CONSTRAINT fk_academic_calendar_session_id FOREIGN KEY (session_id)
REFERENCES public.academic_sessions (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_announcement_session_id | type: CONSTRAINT --
-- ALTER TABLE public.announcements DROP CONSTRAINT IF EXISTS fk_announcement_session_id CASCADE;
ALTER TABLE public.announcements ADD CONSTRAINT fk_announcement_session_id FOREIGN KEY (session_id)
REFERENCES public.academic_sessions (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_exam_schedule_exam_id | type: CONSTRAINT --
-- ALTER TABLE public.exam_schedules DROP CONSTRAINT IF EXISTS fk_exam_schedule_exam_id CASCADE;
ALTER TABLE public.exam_schedules ADD CONSTRAINT fk_exam_schedule_exam_id FOREIGN KEY (exam_id)
REFERENCES public.exams (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_exam_schedule_semester_id | type: CONSTRAINT --
-- ALTER TABLE public.exam_schedules DROP CONSTRAINT IF EXISTS fk_exam_schedule_semester_id CASCADE;
ALTER TABLE public.exam_schedules ADD CONSTRAINT fk_exam_schedule_semester_id FOREIGN KEY (semester_id)
REFERENCES public.semesters (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_exam_schedule_course_id | type: CONSTRAINT --
-- ALTER TABLE public.exam_schedules DROP CONSTRAINT IF EXISTS fk_exam_schedule_course_id CASCADE;
ALTER TABLE public.exam_schedules ADD CONSTRAINT fk_exam_schedule_course_id FOREIGN KEY (course_id)
REFERENCES public.courses (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_exam_session_id | type: CONSTRAINT --
-- ALTER TABLE public.exams DROP CONSTRAINT IF EXISTS fk_exam_session_id CASCADE;
ALTER TABLE public.exams ADD CONSTRAINT fk_exam_session_id FOREIGN KEY (session_id)
REFERENCES public.academic_sessions (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_exam_semester_id | type: CONSTRAINT --
-- ALTER TABLE public.exams DROP CONSTRAINT IF EXISTS fk_exam_semester_id CASCADE;
ALTER TABLE public.exams ADD CONSTRAINT fk_exam_semester_id FOREIGN KEY (semester_id)
REFERENCES public.semesters (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_item_invoice_id | type: CONSTRAINT --
-- ALTER TABLE public.items DROP CONSTRAINT IF EXISTS fk_item_invoice_id CASCADE;
-- ALTER TABLE public.items ADD CONSTRAINT fk_item_invoice_id FOREIGN KEY (invoice_id)
-- REFERENCES public.student_invoices (id) MATCH FULL
-- ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_matric_count_dept_id | type: CONSTRAINT --
-- ALTER TABLE public.matric_counts DROP CONSTRAINT IF EXISTS fk_matric_count_dept_id CASCADE;
ALTER TABLE public.matric_counts ADD CONSTRAINT fk_matric_count_dept_id FOREIGN KEY (dept_id)
REFERENCES public.departments (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

ALTER TABLE public.programmes ADD CONSTRAINT fk_programme_program_id FOREIGN KEY (program_id)
REFERENCES public.programs (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
