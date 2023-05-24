<a name="readme-top"></a>

### This app is in the developmental phase. Please see "Project Status" for more information

<br>
<a name="table-of-contents"></a>
<details>
  <summary>Table of Contents</summary>
  <ul list-style-position="inside">
      <li><a href="#project-status">Project Status</a></li>
      <li><a href="#overview">Overview</a></li>
    </li>
    <li>
      <a href="#stack-and-deployment-instructions">Stack and Deployment instructions</a>
    </li>
  </ul>
</details>

<!-- PROJECT STATUS -->
<details close>
  <summary>Project Status</summary>
    <ul>
      May 24 update
      <li> ReadMe: initial draft created </li> 
      <li> GiphyFacade: method selecting longest words from phrase in progress </li> 
    </ul>
<br>

  <strong><u>Roadmap</u></strong>  
  [ ] Consume and Test Upsplash API  
  [ ] Structure Controllers to work with GraphQL   
  [ ] Incorporate GraphQL  
  [ ] Create Serializers  
</details>
<br>

## Overview
Trivia API exposes endpoints that provide information for a front-end application to build a sassy trivia game!
The end user will have to match a word (from a list) to a photo for five rounds. 

So easy, right!?! 

"BUT"... the user better score well because at the end of the fifth round we evaluate the user's performance and provide a triumphant message celebrating a winning record or a disparaging phrase that playfully "kicks 'em while they're down", along with a gif to emphatically drive home our thoughts!

We provide all this lighthearted content! All the front-end has to do is plug and let their users play. 

<p align="right"><a href="#readme-top">back to top</a></p>


## Stack and Deployment instructions
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

## APIs 


<p align="right"><a href="#readme-top">back to top</a></p>