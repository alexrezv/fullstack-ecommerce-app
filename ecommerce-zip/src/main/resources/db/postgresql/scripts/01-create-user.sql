create
user ecommerceapp with password 'ecommerceapp';

create
database ecommerce encoding 'utf8' owner ecommerceapp;

grant all privileges on database
ecommerce to ecommerceapp;
