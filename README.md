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
June 22, 2023 update
- [x] Gameplay Controller
- [ ] Endgame Controller
- [ ] ErrorHandling Serializer

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
🗂️ Root Directory: {deployment address tbd}

<br>

🔠

**Words**

*'GET /api/v1/???'*

Successful response:

```
{
  "data": {
      }
}
``` 
<br>

🥰
**Compliment**

*'GET /api/v1/???'*

Successful response:

```
{
  "data": {
      }
}
```  
<br>

🤬
**Insult**

*'GET /api/v1/???'*

Successful response:

 ```
{
  "data": {
      }
}
```  
<br>

📸
**Picture**

  *'GET /api/v1/???'*

  Successful response:

 ```
{
  "data": {
      }
}
``` 
<br>

🏁
**Endgame Giphy**

A request should include the number of wins and rounds 
- The default number of wins = 0 and rounds = 5. 
- It is recommended that wins are passed with the request and number of rounds adjust if different from the default 

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