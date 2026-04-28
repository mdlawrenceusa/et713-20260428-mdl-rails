# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
# Seed data for the Coffee Suppliers application
# Mirrors the data from Lab 8.2 (suppliers + beans tables)

puts "Clearing existing data..."
Bean.destroy_all
Supplier.destroy_all

puts "Seeding suppliers..."

suppliers_data = [
  { name: "AnyCompany coffee suppliers",            address: "123 Any Street",   city: "Any Town",  state: "WA", email: "info@example.com",      phone: "555-555-0100" },
  { name: "Central Example Corp. coffee",           address: "100 Main Street",  city: "Nowhere",   state: "CO", email: "info@example.net",      phone: "555-555-0101" },
  { name: "North East AnyCompany coffee suppliers", address: "1001 Main Street", city: "Any Town",  state: "NY", email: "info@example.co",       phone: "555-555-0102" },
  { name: "SE Example corp coffee suppliers",       address: "200 1st street",   city: "None city", state: "GA", email: "info@example.org",      phone: "555-555-0103" },
  { name: "SW Example Corp. coffee",                address: "333 Main st",      city: "Anytown",   state: "AZ", email: "info@example.me",       phone: "555-555-0104" },
  { name: "Northern Example Corp. coffee",          address: "444 Main st",      city: "Not town",  state: "MN", email: "coffee@example.com",    phone: "555-555-0106" },
  { name: "West coast example Corp. coffee",        address: "1212 SE 30th Ave", city: "Any beach", state: "CA", email: "coffee@example.coffee", phone: "555-555-0107" },
  { name: "Southern AnyCompany coffee suppliers",   address: "555 Main st",      city: "Anytown",   state: "TX", email: "coffee@example.biz",    phone: "555-555-0108" }
]

# Build a lookup so we can connect beans to suppliers by their original ID
supplier_lookup = {}
suppliers_data.each_with_index do |attrs, index|
  supplier = Supplier.create!(attrs)
  supplier_lookup[index + 1] = supplier   # original supplier_id was 1-based
  puts "  Created supplier ##{supplier.id}: #{supplier.name}"
end

puts "Seeding beans..."

beans_data = [
  { supplier_id: 1, type: "Arabica",  product_name: "Best bean",      price: 18.00, description: "Delicious, smooth coffee.",                            quantity: 1000 },
  { supplier_id: 1, type: "Robusta",  product_name: "Great bean",     price: 12.00, description: "Full bodied, good to the last drop.",                  quantity: 800  },
  { supplier_id: 2, type: "Robusta",  product_name: "Top bean",       price: 10.00, description: "Great all around bean.",                               quantity: 500  },
  { supplier_id: 2, type: "Liberica", product_name: "Better bean",    price: 14.00, description: "This bean stands above the rest.",                     quantity: 600  },
  { supplier_id: 3, type: "Excelsa",  product_name: "Premiere bean",  price: 18.00, description: "The best bean in all the land",                        quantity: 200  },
  { supplier_id: 4, type: "Arabica",  product_name: "House bean",     price: 11.00, description: "A solid performer.",                                   quantity: 900  },
  { supplier_id: 4, type: "Robusta",  product_name: "Quality bean",   price: 13.00, description: "A great bean for daily use.",                          quantity: 350  },
  { supplier_id: 5, type: "Robusta",  product_name: "Superb bean",    price: 16.00, description: "No bean is better",                                    quantity: 700  },
  { supplier_id: 5, type: "Liberica", product_name: "Top tier bean",  price: 15.00, description: "The bean that impresses.",                             quantity: 300  },
  { supplier_id: 6, type: "Arabica",  product_name: "Stellar bean",   price: 13.00, description: "The top star of beans",                                quantity: 300  },
  { supplier_id: 7, type: "Robusta",  product_name: "Terrific bean",  price: 12.00, description: "This is a great bean",                                 quantity: 800  },
  { supplier_id: 7, type: "Liberica", product_name: "Supreme bean",   price: 17.00, description: "Solid performing bean.  Light roast for smooth taste.", quantity: 700 },
  { supplier_id: 8, type: "Liberica", product_name: "Ace bean",       price: 10.00, description: "Medium roast bean.  Good for brewed coffee.",          quantity: 1000 },
  { supplier_id: 8, type: "Excelsa",  product_name: "Unrivaled bean", price: 16.00, description: "Dark roast bean.  Best for espresso.",                 quantity: 300  }
]

beans_data.each do |attrs|
  original_supplier_id = attrs.delete(:supplier_id)
  bean = supplier_lookup[original_supplier_id].beans.create!(attrs)
  puts "  Created bean: #{bean.product_name} (#{bean.type}) for #{bean.supplier.name}"
end

puts "Done! Seeded #{Supplier.count} suppliers and #{Bean.count} beans."
