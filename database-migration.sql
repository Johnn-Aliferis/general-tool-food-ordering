CREATE TABLE menu_items (
    id SERIAL PRIMARY KEY,
    data JSONB NOT NULL,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,  
    total_amount DECIMAL(10, 2) NOT NULL,
    order_status VARCHAR(255),
    user_email VARCHAR(255),  
    user_phone VARCHAR(20),
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,  
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    order_items JSONB
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,  
    order_id INT REFERENCES orders(order_id) ON DELETE CASCADE,
    payment_status VARCHAR(50) DEFAULT 'pending',
    payment_method VARCHAR(50), 
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    transaction_id VARCHAR(255), 
    payment_reference VARCHAR(255)
);

INSERT INTO menu_items (data) 
VALUES (
    '{
        "categories": [
            {
                "title": "Σαλάτες",
                "items": [
                    {
                        "text": "BLACK ANGUS WITH VEGETABLES AND ONIONS",
                        "description": "Φρέσκο κρεας με μυρωδικά και κανέλα.",
                        "price": "43",
                        "details": {
                            "checkboxes": ["Spicy", "Gluten-Free", "Extra Cheese", "Spicy", "Gluten-Free", "Extra Cheese"],
                            "image": "/assets/about/Souvlaki.jpg"
                        }
                    },
                    {
                        "text": "BLACK ANGUS WITH VEGETABLES",
                        "description": "Μίξη λαχανικών με πάπρικα και αλάτι.",
                        "price": "47",
                        "details": {
                            "checkboxes": [],
                            "image": "/assets/about/Merida.jpg"
                        }
                    },
                    {
                        "text": "BLACK ANGUS WITH VEGETABLES AND ONIONS",
                        "description": "Χυμός λεμόνι και μπύρα μέσα σε κότσι.",
                        "price": "100",
                        "details": {
                            "checkboxes": ["Spicy", "Gluten-Free", "Extra Cheese"],
                            "image": "/assets/about/AboutUs5.jpg"
                        }
                    },
                    {
                        "text": "BLACK ANGUS WITH VEGETABLES",
                        "description": "Μίξη λαχανικών με πάπρικα και αλάτι.",
                        "price": "12",
                        "details": {
                            "checkboxes": ["Low Salt", "Extra Spicy", "Vegan Option"],
                            "image": "/assets/about/AboutUs5.jpg"
                        }
                    },
                    {
                        "text": "BLACK ANGUS WITH VEGETABLES AND ONIONS",
                        "description": "Μίξη λαχανικών με πάπρικα και αλάτι. Μίξη λαχανικών με πάπρικα και αλάτι",
                        "price": "6",
                        "details": {
                            "checkboxes": ["Spicy", "Gluten-Free", "Extra Cheese"],
                            "image": "/assets/about/AboutUs5.jpg"
                        }
                    },
                    {
                        "text": "BLACK ANGUS WITH VEGETABLES",
                        "description": "Μίξη λαχανικών με πάπρικα και αλάτι.",
                        "price": "1.6",
                        "details": {
                            "checkboxes": ["Low Salt", "Extra Spicy", "Vegan Option"],
                            "image": "/assets/about/AboutUs5.jpg"
                        }
                    }
                ],
                "image": "/assets/about/AboutUs5.jpg"
            }
        ]
    }'::jsonb
);