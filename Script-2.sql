-- Создание таблицы для типов животных
DROP TABLE IF EXISTS Animal_Types;
CREATE TABLE Animal_Types (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50)
);

-- Создание таблицы для доступных команд
DROP TABLE IF EXISTS Commands;
CREATE TABLE Commands (
    command_id INT AUTO_INCREMENT PRIMARY KEY,
    command_name VARCHAR(50)
);

-- Создание таблицы для животных
DROP TABLE IF EXISTS Animals;
CREATE TABLE Animals (
    animal_id INT AUTO_INCREMENT PRIMARY KEY,
    animal_name VARCHAR(50),
    birth_date DATE,
    type_id INT,
    command_id INT,
    FOREIGN KEY (type_id) REFERENCES Animal_Types(type_id) ON DELETE CASCADE,
    FOREIGN KEY (command_id) REFERENCES Commands(command_id) ON DELETE CASCADE
);

-- Заполнение таблицы Animal_Types для домашних и вьючных животных
INSERT INTO Animal_Types (type_name) VALUES 
('Домашние животные'),
('Вьючные животные');

-- Заполнение таблицы Commands с командами для домашних животных
INSERT INTO Commands (command_name) VALUES 
('Гав'),
('Мяукание'),
('Крутиться в колесе');

-- Заполнение таблицы Commands с командами для вьючных животных
INSERT INTO Commands (command_name) VALUES 
('Тянуть повозку'),
('Нести груз'),
('Тяжести');

-- Заполнение таблицы Animals с данными о домашних животных
INSERT INTO Animals (animal_name, birth_date, type_id, command_id) VALUES 
('Собаки', '2019-03-15', 1, 1), 
('Кошки', '2018-05-20', 1, 2),  
('Хомяки', '2020-11-10', 1, 3);  

-- Заполнение таблицы Animals с данными о вьючных животных
INSERT INTO Animals (animal_name, birth_date, type_id, command_id) VALUES 
('Лошади', '2017-07-25', 2, 4),   
('Верблюды', '2016-09-12', 2, 5),   
('Ослы', '2015-12-03', 2, 6);   

-- Удаление данных о верблюдах
DELETE FROM Animals WHERE animal_name = 'Верблюды';

-- Создание таблицы "молодые животные" и заполнение её данными
DROP TABLE IF EXISTS YoungAnimals ;
-- Создание таблицы "молодые животные"
CREATE TABLE YoungAnimals (
    animal_id INT AUTO_INCREMENT PRIMARY KEY,
    animal_name VARCHAR(50),
    birth_date DATE,
    age_in_months INT
);

-- Вставка данных о молодых животных в таблицу YoungAnimals
INSERT INTO YoungAnimals (animal_name, birth_date, age_in_months)
SELECT animal_name, birth_date, 
    TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) AS age_in_months
FROM Animals
WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 1 AND 3;

-- Создание представления AnimalDetails
CREATE VIEW AnimalDetails AS
SELECT 
    A.animal_id,
    A.animal_name,
    A.birth_date,
    AT.type_name AS animal_type,
    C.command_name AS animal_command
FROM 
    Animals A
LEFT JOIN 
    Animal_Types AT ON A.type_id = AT.type_id
LEFT JOIN 
    Commands C ON A.command_id = C.command_id;
