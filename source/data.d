import std.conv;
import std.datetime;
import std.file;
import std.stdio;
import std.string;
import std.xml;

struct Product
{
    int productID;
    string productName;
    string category;
    double unitPrice;
    int unitsInStock;

}

struct Order
{
    int orderID;
    DateTime orderDate;
    double total;
}

struct Customer
{
    string customerID;
    string companyName;
    string address;
    string city;
    string region;
    string postalCode;
    string country;
    string phone;
    string fax;
    Order[] orders;
}

Customer[] getCustomerList()
{
    string s = cast(string) std.file.read("data/Customers.xml");
    check(s);
    Customer[] customers;
    auto xml = new DocumentParser(s);
    xml.onStartTag["customer"] = (ElementParser xml) {
        Customer customer;
        xml.onEndTag["id"] = (in Element e) { customer.customerID = e.text(); };
        xml.onEndTag["name"] = (in Element e) { customer.companyName = e.text(); };
        xml.onEndTag["address"] = (in Element e) { customer.address = e.text(); };
        xml.onEndTag["city"] = (in Element e) { customer.city = e.text(); };
        xml.onEndTag["region"] = (in Element e) { customer.region = e.text(); };
        xml.onEndTag["postalcode"] = (in Element e) {
            customer.postalCode = e.text();
        };
        xml.onEndTag["country"] = (in Element e) { customer.country = e.text(); };
        xml.onEndTag["phone"] = (in Element e) { customer.phone = e.text(); };
        xml.onEndTag["fax"] = (in Element e) { customer.fax = e.text(); };
        xml.onStartTag["order"] = (ElementParser od) {
            Order order;
            od.onEndTag["id"] = (in Element e) {
                order.orderID = to!(int)(e.text());
            };

            od.onEndTag["orderdate"] = (in Element e) {
                order.orderDate = DateTime.fromISOExtString(e.text());
            };
            od.onEndTag["total"] = (in Element e) {
                order.total = to!(double)(e.text());
            };
            od.parse();
            customer.orders ~= order;
        };
        xml.parse();
        customers ~= customer;

    };
    xml.parse();
    return customers;
}

Product[] getProducts()
{
    auto products = [Product(1, "Chai", "Beverages", 18, 39)];
    products = products ~ Product(2, "Chang", "Beverages", 19, 17);
    products = products ~ Product(3, "Aniseed Syrup", "Condiments", 10, 13);
    products = products ~ Product(4, "Chef Anton's Cajun Seasoning", "Condiments", 22, 53);
    products = products ~ Product(5, "Chef Anton's Gumbo Mix", "Condiments", 21.3500, 0);
    products = products ~ Product(6, "Grandma's Boysenberry Spread", "Condiments", 25, 120);
    products = products ~ Product(7, "Uncle Bob's Organic Dried Pears", "Produce", 30, 15);
    products = products ~ Product(8, "Northwoods Cranberry Sauce", "Condiments", 40, 6);
    products = products ~ Product(9, "Mishi Kobe Niku", "Meat/Poultry", 97, 29);
    products = products ~ Product(10, "Ikura", "Seafood", 31, 31);
    products = products ~ Product(11, "Queso Cabrales", "Dairy Products", 21, 22);
    products = products ~ Product(12, "Queso Manchego La Pastora", "Dairy Products", 38, 86);
    products = products ~ Product(13, "Konbu", "Seafood", 6, 24);
    products = products ~ Product(14, "Tofu", "Produce", 23.2500, 35);
    products = products ~ Product(15, "Genen Shouyu", "Condiments", 15.5000, 39);
    products = products ~ Product(16, "Pavlova", "Confections", 17.4500, 29);
    products = products ~ Product(17, "Alice Mutton", "Meat/Poultry", 39, 0);
    products = products ~ Product(18, "Carnarvon Tigers", "Seafood", 62.5000, 42);
    products = products ~ Product(19, "Teatime Chocolate Biscuits", "Confections", 9.2000, 25);
    products = products ~ Product(20, "Sir Rodney's Marmalade", "Confections", 81, 40);
    products = products ~ Product(21, "Sir Rodney's Scones", "Confections", 10, 3);
    products = products ~ Product(22, "Gustaf's Knäckebröd", "Grains/Cereals", 21, 104);
    products = products ~ Product(23, "Tunnbröd", "Grains/Cereals", 9, 61);
    products = products ~ Product(24, "Guaraná Fantástica", "Beverages", 4.5000, 20);
    products = products ~ Product(25, "NuNuCa Nuß-Nougat-Creme", "Confections", 14, 76);
    products = products ~ Product(26, "Gumbär Gummibärchen", "Confections", 31.2300, 15);
    products = products ~ Product(27, "Schoggi Schokolade", "Confections", 43.9000, 49);
    products = products ~ Product(28, "Rössle Sauerkraut", "Produce", 45.6000, 26);
    products = products ~ Product(29, "Thüringer Rostbratwurst", "Meat/Poultry", 123.7900, 0);
    products = products ~ Product(30, "Nord-Ost Matjeshering", "Seafood", 25.8900, 10);
    products = products ~ Product(31, "Gorgonzola Telino", "Dairy Products", 12.5000, 0);
    products = products ~ Product(32, "Mascarpone Fabioli", "Dairy Products", 32, 9);
    products = products ~ Product(33, "Geitost", "Dairy Products", 2.5000, 112);
    products = products ~ Product(34, "Sasquatch Ale", "Beverages", 14, 111);
    products = products ~ Product(35, "Steeleye Stout", "Beverages", 18, 20);
    products = products ~ Product(36, "Inlagd Sill", "Seafood", 19, 112);
    products = products ~ Product(37, "Gravad lax", "Seafood", 26, 11);
    products = products ~ Product(38, "Côte de Blaye", "Beverages", 263.5000, 17);
    products = products ~ Product(39, "Chartreuse verte", "Beverages", 18, 69);
    products = products ~ Product(40, "Boston Crab Meat", "Seafood", 18.4000, 123);
    products = products ~ Product(41, "Jack's New England Clam Chowder", "Seafood", 9.6500, 85);
    products = products ~ Product(42, "Singaporean Hokkien Fried Mee", "Grains/Cereals", 14, 26);
    products = products ~ Product(43, "Ipoh Coffee", "Beverages", 46, 17);
    products = products ~ Product(44, "Gula Malacca", "Condiments", 19.4500, 27);
    products = products ~ Product(45, "Rogede sild", "Seafood", 9.5000, 5);
    products = products ~ Product(46, "Spegesild", "Seafood", 12, 95);
    products = products ~ Product(47, "Zaanse koeken", "Confections", 9.5000, 36);
    products = products ~ Product(48, "Chocolade", "Confections", 12.7500, 15);
    products = products ~ Product(49, "Maxilaku", "Confections", 20, 10);
    products = products ~ Product(50, "Valkoinen suklaa", "Confections", 16.2500, 65);
    products = products ~ Product(51, "Manjimup Dried Apples", "Produce", 53, 20);
    products = products ~ Product(52, "Filo Mix", "Grains/Cereals", 7, 38);
    products = products ~ Product(53, "Perth Pasties", "Meat/Poultry", 32.8000, 0);
    products = products ~ Product(54, "Tourtière", "Meat/Poultry", 7.4500, 21);
    products = products ~ Product(55, "Pâté chinois", "Meat/Poultry", 24, 115);
    products = products ~ Product(56, "Gnocchi di nonna Alice", "Grains/Cereals", 38, 21);
    products = products ~ Product(57, "Ravioli Angelo", "Grains/Cereals", 19.5000, 36);
    products = products ~ Product(58, "Escargots de Bourgogne", "Seafood", 13.2500, 62);
    products = products ~ Product(59, "Raclette Courdavault", "Dairy Products", 55, 79);
    products = products ~ Product(60, "Camembert Pierrot", "Dairy Products", 34, 19);
    products = products ~ Product(61, "Sirop d'érable", "Condiments", 28.5000, 113);
    products = products ~ Product(62, "Tarte au sucre", "Confections", 49.3000, 17);
    products = products ~ Product(63, "Vegie-spread", "Condiments", 43.9000, 24);
    products = products ~ Product(64, "Wimmers gute Semmelknödel", "Grains/Cereals", 33.2500, 22);
    products = products ~ Product(65, "Louisiana Fiery Hot Pepper Sauce",
            "Condiments", 21.0500, 76);
    products = products ~ Product(66, "Louisiana Hot Spiced Okra", "Condiments", 17, 4);
    products = products ~ Product(67, "Laughing Lumberjack Lager", "Beverages", 14, 52);
    products = products ~ Product(68, "Scottish Longbreads", "Confections", 12.5000, 6);
    products = products ~ Product(69, "Gudbrandsdalsost", "Dairy Products", 36, 26);
    products = products ~ Product(70, "Outback Lager", "Beverages", 15, 15);
    products = products ~ Product(71, "Flotemysost", "Dairy Products", 21.5000, 26);
    products = products ~ Product(72, "Mozzarella di Giovanni", "Dairy Products", 34.8000, 14);
    products = products ~ Product(73, "Röd Kaviar", "Seafood", 15, 101);
    products = products ~ Product(74, "Longlife Tofu", "Produce", 10, 4);
    products = products ~ Product(75, "Rhönbräu Klosterbier", "Beverages", 7.7500, 125);
    products = products ~ Product(76, "Lakkalikööri", "Beverages", 18, 57);
    products = products ~ Product(77, "Original Frankfurter grüne Soße", "Condiments", 13, 32);
    return products;
}
