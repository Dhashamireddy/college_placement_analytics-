
INSERT INTO companies (
    company_name,
    industry,
    company_website,
    location,
    company_size
)
VALUES
    ('Google', 'Technology', 'https://google.com', 'Bengaluru', 'Enterprise'),
    ('Microsoft', 'Technology', 'https://microsoft.com', 'Hyderabad', 'Enterprise'),
    ('Amazon', 'E-commerce', 'https://amazon.com', 'Bengaluru', 'Enterprise'),
    ('Infosys', 'IT Services', 'https://infosys.com', 'Bengaluru', 'Enterprise'),
    ('TCS', 'IT Services', 'https://tcs.com', 'Mumbai', 'Enterprise'),
    ('Wipro', 'IT Services', 'https://wipro.com', 'Bengaluru', 'Enterprise'),
    ('Flipkart', 'E-commerce', 'https://flipkart.com', 'Bengaluru', 'Large'),
    ('Razorpay', 'FinTech', 'https://razorpay.com', 'Bengaluru', 'Large'),
    ('Swiggy', 'Food Technology', 'https://swiggy.com', 'Bengaluru', 'Large'),
    ('Accenture', 'Consulting', 'https://accenture.com', 'Bengaluru', 'Enterprise');

SELECT * FROM companies;
