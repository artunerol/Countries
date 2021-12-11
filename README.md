
**What to do when the app has launched**

READ

- Save/Unsave countries with "star" button.
- Navigate to "Saved" tab.
- If you want to see the star buttons to be filled in "saved" tab, you need to go back to "Home" tab, then back to "Saved" tab.
- Select any country you would like to.
- In detail page, you can save/unsave the country.
- You can navigate to wiki pake for selected country.

**APP Navigation Notes:**

- When the "Home" tab is loaded, press "star" shaped button to save the relevant country to the "Saved" tab. You'll see selected country in "Saved" tab.

- When you saved a country, click to "save" tab to navigate. There, you'll see the country you selected will have the star button unfilled. To fix that, you need to press to "Home" tab then go back to "Saved" tab. There you'll see selected country with a filled "star button".

- If you see a selected country with a filled "star" button in "saved" tab, you can unselect it, then go back to "Home" tab and back to "Saved" tab to see that it was deleted from the list.

- You can navigate to detail page for countries from both of the tabs. When you navigate to detail page, you'll see the country flag, "See more Information" button (which will lead you to wiki page of related country), and an other "star" button on the rightItem of the navigationBar.(This button will already be pressed if you navigate to details of a country which was saved before.)

- By pressing the "star" button inside of the detail page, you can save/unsave the related country to "saved" tab.

--------------------------------------------------------------------------------------------------

**APP Notes and General Information:**

- 10 Countries have been added from the API, pagination is not added.

- In detail page for countries, many country flags have plain white areas on the screen. This is happening because api sends the images without trimming the white plain areas.

- API for getting images have been handled differently in APIHanlder class. Regular api to get countries doesnt have image URLs in it. That is why we use 2 different handler. To investigate more of it, you can checkout the api documentation links below:

    * API documentation to get all countries: https://rapidapi.com/wirefreethought/api/geodb-cities/
    * API documentation to get specific country with image: https://rapidapi.com/wirefreethought/api/geodb-cities/
    * You can test endpoints for both via their links.
    
- Country flag Images are shown as webView in DetailsViewController. The reason to that is, the image links are coming as ".svg" files instead of ".jpg". In swift, there is no embedded framework to convert .svg to UIImage. Instead of using third party frameworks, webView workaround has been implemented.

- Saving/Unsaving a country is being flagged in UserDefaults as a boolean with the key names of that country.

--------------------------------------------------------------------------------------------------

**What to improve on the app**

- Configuration of seeing a country with a filled/unfilled star in tableViews.
- Adding pagination in order to see more countries on the "Home" page.
- Using third party frameworks.
- Reactive coding can be implemented.
- Using CoreData to save a country instead of Userdefaults.(Currently handling a small data, that is why I choose to work with userdefaults.)
