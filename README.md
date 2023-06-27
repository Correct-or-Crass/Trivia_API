<!-- PROJECT LOGO -->
<div align="center">
  <p align="center">
    <img src="https://github.com/Correct-or-Crass/logo/blob/main/Screen%20Shot%202023-05-13%20at%2011.50.47%20AM.png" alt="Profile" width="600" >
  </p>
</div>  
<a name="readme-top"></a>

### This app is in the developmental phase. Please see "Project Status" for more information

<br>
<a name="table-of-contents"></a>
<details>
  <summary>Table of Contents</summary>
  <ul list-style-position="inside">
      <li><a href="#mission_statement">Mission Statement</a></li>
      <li><a href="#project-status">Project Status</a></li>
      <li><a href="#overview">Overview</a></li>
    </li>
    <li>
      <a href="#stack-and-deployment-instructions">Stack and Deployment instructions</a>
    </li>
    <li>
      <a href="#external_apis">External APIs</a>
    </li>
    <li>
      <a href="#apis">APIs</a>
    </li>
  </ul>
</details>

## Project Status
___
June 27, 2023 update
- [x] Gameplay Controller
- [x] Endgame Controller
- [ ] ErrorHandling Serializer
- [ ] Deployment to www.correctorcrass.com
- [ ] Integration of CI/CD pipeline

## Mission Statement
___
Our mission is to create a complete and tested back end application that can be consumed by front end developers to create an functional Trivia Game.

## Overview
___
Trivia API exposes endpoints that provide information for a front-end application to build a sassy trivia game!
The end user will have to match a word (from a list) to a photo for five rounds. 

So easy, right!?! 

"BUT"... the user better score well because at the end of the fifth round we evaluate the user's performance and provide a triumphant message celebrating a winning record or a disparaging phrase that playfully "kicks 'em while they're down", along with a gif to emphatically drive home our thoughts!

We provide all this lighthearted content! All the front-end has to do is plug and let their users play. 

<p align="right"><a href="#readme-top">back to top</a></p>

## Stack and Deployment instructions
___
- Ruby 3.2.2
- Rails 7.0.4

Deploy locally:
1. Clone the repo
   ```
   git clone git@github.com:Correct-or-Crass/Trivia_API.git
   ```
2. Install gems
   ```
   bundle install
   ```
3. Setup db
   ```
   rails db:{drop,create,migrate}
   ```

4. Run RSpec tests
    ```
    bundle exec rspec spec
    ```
<p align="right"><a href="#readme-top">back to top</a></p>

## External APIs 
___
This application relies on the following APIs:

* [Random Words / Compliment / Insult Generator][Random_Generator-url]

* [Unsplash][Unsplash-url]

* [Giphy][Giphy-url]

<p align="right"><a href="#readme-top">back to top</a></p>

## APIs
___
This application creates the following API endpoints:

🗂️ **Root Directory:** www.correctorcrass.com
<br>

🔠
**Words**
___
- Returns a correct answer, 4 words (1 of which is the correct answer) and a photo related to the correct answer
- Photo contains the image's url, the image owner's name and account link to enable front end to credit image owner if desired

### *GET /api/v1/game_plays*

Successful response:

```
{
  "data": {
      "type": "game_play",
      "attributes": {
          "photo": {
              "image_url": "https://images.unsplash.com/photo-1593132517397-ceb31d77194a?ixid=M3w0MTg4MjB8MHwxfHNlYXJjaHw2fHxDYXRjaHxlbnwwfHx8fDE2ODc0NzI2NzN8MA&ixlib=rb-4.0.3&utm_source=Trivia_API&utm_medium=referral&utm_campaign=api-credit",
              "creator_name": "mmcgregor",
              "creator_link": "https://api.unsplash.com/photos/Ns8trMR4Om8?utm_source=Trivia_API&utm_medium=referral&utm_campaign=api-credit"
          },
          "answer": "Catch",
          "choices": [
              "Staircase",
              "Wood",
              "Fist",
              "Catch"
          ]
      }
  }
}
```
<br>

___
- An integer param can be provided to return more or less than the default 4 word choices

### *GET /api/v1/game_plays?num=5*

Successful response:

```
{
  "data": {
      "type": "game_play",
      "attributes": {
          "photo": {
              "image_url": "https://images.unsplash.com/photo-1593132517397-ceb31d77194a?ixid=M3w0MTg4MjB8MHwxfHNlYXJjaHw2fHxDYXRjaHxlbnwwfHx8fDE2ODc0NzI2NzN8MA&ixlib=rb-4.0.3&utm_source=Trivia_API&utm_medium=referral&utm_campaign=api-credit",
              "creator_name": "mmcgregor",
              "creator_link": "https://api.unsplash.com/photos/Ns8trMR4Om8?utm_source=Trivia_API&utm_medium=referral&utm_campaign=api-credit"
          },
          "answer": "Catch",
          "choices": [
              "Staircase",
              "Wood",
              "Fist",
              "Catch",
              "Motorbike"
          ]
      }
  }
}
``` 

🏁
**Endgame**
___
- A request should include the number of wins and rounds, otherwise a default of wins = 0, rounds = 5 is provided
- It is recommended that wins are passed with the request and number of rounds adjusted if necessary 
- A winning endgame requires a 60% or higher correct score ratio

`Endpoints Examples`:
  ### *GET /api/v1/endgame?wins=3*
  ###  *GET /api/v1/endgame?wins=4&rounds=7*

  Successful response:
 ```
{
  "data": {
          type: "endgame",
           attributes: {
                      phrase: "I bet you make babies smile.",
                      gif: {
                            url: "https://giphy.com/gifs/sensual-UElLGSOqm8XYI", 
                            title:"making love GIF", 
                            rating: "r"
                            }
      }
}
``` 

<p align="right"><a href="#readme-top">back to top</a></p>




  <div align="center">
  <p align="center">

<h2>Meet our Development Team !</h2>

  |       |       |       |       |
  | :---: | :---: | :---: | :---: |
  | <img src="https://avatars.githubusercontent.com/u/108754743?v=4" alt="Profile" width="80" height="80"><br> | <img src="https://avatars.githubusercontent.com/u/106788066?v=4" alt="Profile" width="80" height="80"><br> | <img src="https://avatars.githubusercontent.com/u/87088092?v=4" alt="Profile" width="80" height="80"><br> | <img src="https://avatars.githubusercontent.com/u/109649285?s=96&v=4" alt="Profile" width="80" height="80"><br> 
  |   Lacey Weaver   | Sergio Azcona | Devin Pile | Bryan Flanagan |
  | [![Github]][GithubLacey-url] | [![Github]][GithubSergio-url] | [![Github]][GithubDevin-url] | [![Github]][GithubBryan-url] |
  | [![LinkedIn]][LinkedInLacey-url] | [![LinkedIn]][LinkedInSergio-url] | [![LinkedIn]][LinkedInDevin-url] | [![LinkedIn]][LinkedInBryan-url] |
  ___

  </p>
</div>
<p align="right"><a href="#readme-top">back to top</a></p>

[Github]: https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white
[GithubLacey-url]: https://github.com/jlweave
[GithubSergio-url]: https://github.com/Sergio-Azcona
[GithubDevin-url]: https://github.com/devinpile
[GithubBryan-url]: https://github.com/bflanagan138
[LinkedIn]: https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white
[LinkedInLacey-url]: https://www.linkedin.com/in/lacey-weaver-be-dev/
[LinkedInSergio-url]: https://www.linkedin.com/in/sergio-azcona/
[LinkedInDevin-url]: https://www.linkedin.com/in/devin-pile/
[LinkedInBryan-url]: https://www.linkedin.com/in/bryanflanagan138/
[Random_Generator-url]: https://github.com/Correct-or-Crass/random_word_insult_compliment_generator
[Unsplash-url]: https://unsplash.com/developers
[Giphy-url]:https://developers.giphy.com/
