## About

A simple restaurant finder app using Flutter and Dart for iOS, Android and web. This app shows how to connect network data with the BLoC Pattern.

Hosted web example here: http://restaurant-finder-flutter.s3-website-eu-west-1.amazonaws.com

## Functionality

- Find restaurants by location and type of food served
- View restaurant details
- Favorite restaurants
- View all favorite restaurants

## Install and Setup

You will need Flutter installed, along with a number of dependencies for building and running iOS and Android apps on simulators. You can find the install instructions here: https://flutter.dev/docs/get-started/install/macos#web-setup

To run with web, follow the instructions here: https://flutter.dev/docs/get-started/web

## Zomato Setup

You will need a Zomato account and API Key. Visit here to generate API Key (and create an account, if you don't have one): https://developers.zomato.com/api

## Run

Run on a device (once it is connected):

    $ flutter run --dart-define=ZOMATO_API_KEY=[YOUR_ZOMATO_API_KEY]

Run on a web browser (if you have installed support for running on web):

    $ flutter run -d chrome --dart-define=ZOMATO_API_KEY=[YOUR_ZOMATO_API_KEY]

## TODO

- Test cases
