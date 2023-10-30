USE lab_db;

INSERT INTO cars(cars_id, vin, manufacturer, model, year, color, invoives)
VALUES (1, "3K096I98581DHSNUP", "Volkswagen", "Tiguan", 2019, "Blue"),
		(2, "RKXVNNIHLVVZOUB4M", "Peugot", "Rifter", 2019, "Red"),
        (3, "RKXVNNIHLVVZOUB4M", "Ford", "Fusion", 2018, "White");
        
INSERT INTO Customers ( customer_id, phone_nr, mail, address, city, state/province, country, zip_code)
VALUES (0, 10001, "Pablo Picasso", 0034 636 17 63 82, "-", "Paseo de la Chopera, 14	", "Madrid", "Madrid", "Spain", 28045),
		(1, 20001, "Abraham Lincoln", 001 305 907 7086, "-", "120 SW 8th St", "Miami", "Florida", "United States", "33130);
        

