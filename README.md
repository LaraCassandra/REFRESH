<!-- PROJECT SHIELDS -->

![Contributors](https://img.shields.io/github/contributors/LaraCassandra/QuizBee?style=for-the-badge&color=blue)
![Repo Size](https://img.shields.io/github/repo-size/LaraCassandra/QuizBee?style=for-the-badge)
![Code Size](https://img.shields.io/github/languages/code-size/LaraCassandra/QuizBee?style=for-the-badge)
![Languages](https://img.shields.io/github/languages/count/LaraCassandra/QuizBee?style=for-the-badge)
![Top Language](https://img.shields.io/github/languages/top/LaraCassandra/QuizBee?style=for-the-badge)



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/LaraCassandra/QuizBee">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">QuizBee</h3>

  <p align="center">
    Animal Trivia App
    <br />

  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
      <a href="#features">Features and Functions</a>
      <ul>
        <li><a href="#functions">Functions</a></li>
      </ul>
    </li>
    <li>
      <a href="#concept-process">Concept Process</a>
      <ul>
        <li><a href="#ideation">Ideation</a></li>
        <li><a href="#wireframes">Wireframes</a></li>
        <li><a href="#userflow">Userflow</a></li>
      </ul>
    </li>
    <li>
      <a href="#development-implementation">Development Implementation</a>
      <ul>
        <li><a href="#challenges">Challenges</a></li>
        <li><a href="#highlights">Highlights</a></li>
      </ul>
    </li>
    <li>
      <a href="#peer-reviews">Peer Reviews</a>
      <ul>
        <li><a href="#feedback">Feedback</a></li>
        <li><a href="#future-changes">Future Changes</a></li>
      </ul>
    </li>
    <li><a href="#video-demonstration">Video Demo</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#authors">Authors</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>

<br>

<!-- ABOUT THE PROJECT -->
## About The Project

<br>

<img src="images/intro.png" alt="About project">

<br>

In times of COVID-19 and the lockdown, a lighthearted trivia is just the right thing to get anyone feeling better. For Android 301 we were required to create a fun trivia app to cheer up our friends and family in these tough times.

QuizBee is the simple, yet entertaining quiz app you've been waiting for to test your animal fun facts. Choose from different categories if you think thats where your strength lies, but be warned, you might get caught by a sneaky question. You may even learn a thing or two. :wink:

<br>

### Built With

QuizBee is an android application built using:

* [Kotlin](https://kotlinlang.org/) Language
* [Android Studio](https://developer.android.com/studio) as IDE
* [Github](https://github.com/) for Git Version Control

<br>

<!-- GETTING STARTED -->
## Getting Started

Let's get started, simply follow the steps below and you'll have your own copy up and running to do with whatever your heart may desire.


### Prerequisites

This project requires that you have the latest version of Android Studio, but no worries, you can download Android Studio [here](https://developer.android.com/studio)!

### Installation

There are a few ways you can go about cloning this repo, check it out:

<br>

1. Git
   ```sh
   git clone https://github.com/LaraCassandra/QuizBee.git
   ```

Once you've clone the repo, just open up Android Studio and select `File -> Open`, this will open a file explorer so just find the project directory and click the `open` button.

<br>

2. Android Studio

You can open the project straight from Android Studio by selecting `File -> New -> Project from Version Control`. Make sure you have Git selected on the dropdown, place the link in the URL field and click `Clone`.

```sh
https://github.com/LaraCassandra/QuizBee.git
```

<br>

<!-- FEATURES AND FUNCTIONS -->
## Features and Functions

### Add your name
<img src="images/feature1.png" alt="Feature One">
Enter your name and get the show on the road.

<br>

### Choose a topic
<img src="images/feature2.png" alt="Feature Two">
Pick from four animal related topics - Land Animals, Sea Creatures, Sky Beings and General.

<br>

### See your results
<img src="images/feature3.png" alt="Feature Three">
See how you did in the results page and the scoreboard.

<br>

### Functions
This project makes use of:
- `Activities` to display and add functionality to our screens
- `Relative`, `Linear` and `Grid` layouts to create and spice up the design
- `Intents` to move through and take data to different activities
- `Constants` to hold the arrays of questions
- `Shared Preferences` to save the user data into local device storage

<br>

<!-- CONCEPT PROCESS -->
## Concept Process

### Ideation

The ideation phase begins with different tasks to get a good idea of what the application could become. These tasks include:
- Research
- Mindmaps
- Moodboards

### Wireframes

<img src="images/wireframes.png" alt="Wireframes">

<br>

### Userflow

<img src="images/userflow.png" alt="Userflow">

<br>

## Development Implementation

During the development implentation I experienced some challenges and highlights

### Challenges
- Understanding `Activities` and how they can be used dynamically to display data (I did not understand this and so I created too many unnecessary activities)
- Learning how to save data on the local storage with `Shared Preferences` (I was not able to get the user's name saved to the Shared Preferences)
- Using `Intent` to navigate and move data between activities (This was a new concept that I didn't understand at first until I applied it)
- Understanding how `Constants` work to store data (I got confused with the usage of Constants and assumed Share Preferences can only work with Constants - which I know now is not the case)

### Highlights
- Creating a mobile application for the first time and using Kotlin has been a very fun experience overall
- When you implement functionality and it does what its supposed to do is a satisfying feeling
- I had a good foundation to work off because this module was taught well
- Stuck to a good schedule and finished all requirements

<br>

## Peer Reviews

In week 6, we were able to get **valuable** feedback from our lecturer and peer in order to improve the project

### Feedback
- The overall theme of animals is fun and the topics being catergorized by nature is appreciated
- The questions are interesting and not too easy
- The bee icon draws a lot of attention
- More styling and imagery that relates to animals would be ideal to really ignite the app

### Future Changes
- Learn to code the activity pages *dynamically* instead of having so many activities
- Improve the overall design and implement responsiveness to fit all screens
- Create profiles where users can play against each other and compare their scores
- Questions with different levels or difficulties 
- Answer validation so that the user can see if there answer is correct before moving onto the next one

<br>

## Video Demonstration

[Download Demo](https://github.com/LaraCassandra/QuizBee/blob/main/images/LaraCook_190218_Android301_Demo.mp4)

<br>
 
<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/LaraCassandra/QuizBee/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- AUTHORS -->
## Authors
Lara Cook - [https://github.com/LaraCassandra](https://github.com/LaraCassandra)

<br>

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<br>

<!-- CONTACT -->
## Contact

Lara Cook | 190218

190218@virtualwindow.co.za

Project Link: [https://github.com/LaraCassandra/QuizBee](https://github.com/LaraCassandra/QuizBee)


<br>

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [Android Documentation](https://developer.android.com/docs)
* [Flat Icon](https://www.flaticon.com/)
* [Radio Button Styling](https://www.youtube.com/watch?v=EyRwTSsFQUo)
* [Links to Animal Information](https://docs.google.com/document/d/1Vb0oo3N_QRzgMYcSF82cjqoyQ9xR5W4e74T2N9NrGzU/edit)





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/LaraCassandra/repo.svg?style=for-the-badge
[contributors-url]: https://github.com/LaraCassandra/repo/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/LaraCassandra/repo.svg?style=for-the-badge
[forks-url]: https://github.com/LaraCassandra/repo/network/members
[stars-shield]: https://img.shields.io/github/stars/LaraCassandra/repo.svg?style=for-the-badge
[stars-url]: https://github.com/LaraCassandra/repo/stargazers
[issues-shield]: https://img.shields.io/github/issues/LaraCassandra/repo.svg?style=for-the-badge
[issues-url]: https://github.com/LaraCassandra/repo/issues
[license-shield]: https://img.shields.io/github/license/LaraCassandra/repo.svg?style=for-the-badge
[license-url]: https://github.com/LaraCassandra/repo/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/LaraCassandra
