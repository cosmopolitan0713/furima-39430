crumb :root do
  link "Home", root_path
end

crumb :item_new do
  link "商品出品", new_item_path
  parent :root
end