# seed companies
pepsi = Company.create(name: "Pepsi")
coca_cola = Company.create(name: "Coca-Cola")

pepsi.users.create(email: "marcopoggi2017+pepsi@gmail.com", password: "pepsi123")
coca_cola.users.create(email: "marcopoggi2017+coca_cola@gmail.com", password: "coca123")
