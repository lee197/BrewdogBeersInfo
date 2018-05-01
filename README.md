# BrewdogBeersInfo

MVVM example

Instructions to run the project
(1) To run it, Please download project and run pod install first (2) To test it, Please find the sampleData in NetworkingManager.swift and relace the return value "".utf8Encoded with

"{"id": 1,"name": "Buzz","tagline": "A Real Bitter Experience.","first_brewed": "09/2007", "description": "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.", "image_url": "https://images.punkapi.com/v2/keg.png\",\"abv\": 4.5,"ibu": 60,"target_fg": 1010,"target_og": 1044, "ebc": 20,"srm": 10,"ph": 4.4, "attenuation_level": 75,"volume": {"value": 20,"unit": "liters"}, "boil_volume": {"value": 25,"unit": "liters"},"method": {"mash_temp": [{"temp": {"value": 64,"unit": "celsius"}, "duration": 75}],"fermentation": {"temp": {"value": 19,"unit": "celsius"}},"twist": null}, "ingredients": {"malt": [{"name": "Maris Otter Extra Pale","amount": {"value": 3.3,"unit": "kilograms"}}, {"name": "Caramalt","amount": {"value": 0.2,"unit": "kilograms"}},{"name": "Munich","amount": {"value": 0.4, "unit": "kilograms"}}],"hops": [{"name": "Fuggles","amount": {"value": 25,"unit": "grams"},"add": "start", "attribute": "bitter"},{"name": "First Gold","amount": {"value": 25,"unit": "grams"},"add": "start","attribute": "bitter"}, {"name": "Fuggles","amount": {"value": 37.5,"unit": "grams"},"add": "middle","attribute": "flavour"},{"name": "First Gold", "amount": {"value": 37.5,"unit": "grams"},"add": "middle","attribute": "flavour"},{"name": "Cascade","amount": {"value": 37.5,"unit": "grams" },"add": "end","attribute": "flavour"}],"yeast": "Wyeast 1056 - American Ale™"}, "food_pairing": ["Spicy chicken tikka masala","Grilled chicken quesadilla","Caramel toffee cake"],"brewers_tips": "The earthy and floral aromas from the hops can be overpowering. Drop a little Cascade in at the end of the boil to lift the profile with a bit of citrus.", "contributed_by": "Sam Mason "}".utf8Encoded

As I known, the project shouldn't contain any api information.

What has been done:
In this project, I have built all the screens as requested and finish the first business requirement and I have finished part of the unit test due to my time shortage, but that did proved my ability to code prodessionally and do unit test.

Please be aware that I didn't put much efforts on UI design, as I think the code structure is way more important.

3.Dependencies:

'Moya' 'ObjectMapper' 'AlamofireImage'

Moya is for networking, objectmapper is for json parse, AlamofireImage is for online image.

4.Architectural Decisions:

I decided to us MVVM design pattern as I have been using it for a while and I am refactor the code to fit MVVM design. MVVM is the most popular design pattern for mobile developer to use, so I choose this one.

In my project, I create 4 folders : Service, Model, ViewModel, View. In the service folder, we have the networking and networking execution class ,Once the data requested from the api, it converts to Model directly for further useage. The ViewModel stores the all the business logic for each View.

When the view transit to another View, the prepare method will pass the relevant model and some other values (indexPath .etc) to next ViewMode for the useage of new view.

5.known issues:

(1) The image dynamic resize can be done better, as the size of images from api are different, this could be solved by creating a dynamic cell and dynamic constrains to manage the image view size according to the image size.

(2) The View and ViewModel binding can be executed by using RXSWIFT, which is I am working on it on my own project. Currently I am just showing the data by reloading the tableView.

(3) The best way to update button state is notifying api for every button state change. As I can find the api to post changes, so I just updated the model.

I would be very appriciate if the employer can reply to me regarding any problem or suggestion as I will keep working on it no matter what is the testing results. Thanks
