// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.product_catalog.insertMany([
  {
    _id: "ELEC1001",
    category: "Electronics",
    name: "UltraView 55 Smart TV",
    brand: "VisionX",
    price: 48999,
    currency: "INR",
    warranty: { period_months: 24, type: "manufacturer" },
    specs: {
      screen_size_inches: 55,
      resolution: "4K UHD",
      voltage: "220-240V",
      ports: ["HDMI", "USB", "Ethernet"]
    },
    tags: ["smart-tv", "entertainment", "wifi-enabled"],
    stock: { warehouse: "BLR-01", available_units: 18 }
  },
  {
    _id: "CLOT2001",
    category: "Clothing",
    name: "Classic Denim Jacket",
    brand: "UrbanWeave",
    price: 2799,
    currency: "INR",
    sizes: ["S", "M", "L", "XL"],
    material: { outer: "100% cotton denim", lining: "polyester blend" },
    variants: [
      { color: "Blue", sku: "UJ-BLU-M", available: true },
      { color: "Black", sku: "UJ-BLK-L", available: true }
    ],
    care_instructions: ["machine wash cold", "do not bleach"]
  },
  {
    _id: "GROC3001",
    category: "Groceries",
    name: "Organic Whole Wheat Flour",
    brand: "FarmPure",
    price: 145,
    currency: "INR",
    expiry_date: ISODate("2024-12-20T00:00:00Z"),
    weight_kg: 5,
    nutritional_info: {
      serving_size_g: 100,
      calories: 340,
      protein_g: 12,
      fiber_g: 10
    },
    storage: {
      temperature: "cool and dry place",
      opened_shelf_life_days: 30
    },
    allergens: ["gluten"]
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.product_catalog.find(
  { category: "Electronics", price: { $gt: 20000 } },
  { _id: 1, name: 1, brand: 1, price: 1 }
);

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.product_catalog.find(
  {
    category: "Groceries",
    expiry_date: { $lt: ISODate("2025-01-01T00:00:00Z") }
  },
  { _id: 1, name: 1, expiry_date: 1 }
);

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.product_catalog.updateOne(
  { _id: "ELEC1001" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.product_catalog.createIndex({ category: 1 });
// This index speeds up category-based filtering, which is common in OP2 and OP3.
