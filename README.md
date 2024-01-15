# Bridge Software Task

A simple e-commerce app

## Description

A simple e-commerce application with product listing, product detail and cart page. Project is using riverpod for state management

https://asos2.p.rapidapi.com
This is the base url I have used for calling apis

## Used packages

- flutter_screenutil => for screen responsiveness
- flutter_riverpod => for state management
- carousel_slider => for displaying promotions and product images
- connectivity_plus => to check internet connectivity
- dio => for calling apis
- flutter_spinkit => a beautiful loader
- flutter_html => to show html tags in app
- equatable => for object comparison

## Project Structure

    models
    network
    providers
        |
        |----- cart
               product_detail
               products
    ui
        |
        |----- screens
               widgets
    utils