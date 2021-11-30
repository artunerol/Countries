
**APP General Notes:**

- 10 Countries have been added from the API, pagination is not added.

- In detail page for countries, many country flags have plain white areas on the screen. This is happening because api sends the images without trimming the white plain areas.

- API for getting images have been handled differently in APIHanlder class. Regular api to get countries doesnt have image URLs in it. That is why we use 2 different handler. To investigate more of it, you can checkout the api documentation links below:

    * API documentation to get all countries: https://rapidapi.com/wirefreethought/api/geodb-cities/
    * API documentation to get specific country with image: https://rapidapi.com/wirefreethought/api/geodb-cities/
    *You can test endpoints for both via that link.
    
- Country flag Images are shown as webView in DetailsViewController. The reason to that is, the image links are coming as ".svg" files instead of ".jpg". In swift, there is no embedded framework to convert .svg to UIImage. Instead of using third party frameworks, webView workaround has been implemented.

---------------------------------------------------------------------------------------------------------------------------------------------------------

**APP Navigation:**

- While clicking the star buttons on the "Home" tab, sometimes you might need to click and hold them or click twice in order to save a country.

- After pressing a star button, you can see the selected countries in "Saved" Tab

- If you want to deselect some countries in "Saved" tab, you need to first navigate to "Home" tab, then go back to "Saved" tab. By doing that, you'll see that the stars are getting filled on "saved" tab.

