# Avala - Front End Code Challenge

[Requirements](https://www.notion.so/Front-end-SW-Take-Home-Challenge-ea868642398347b2a80a5275eef3dfef)

In order to solve the challenge I've followed this [tutorial](https://bloclibrary.dev/#/fluttercountertutorial) and changed the necessary stuff.

The external libraries I made used of are: 
* http
* bloc
* flutter_bloc

## Execution

In order to run this project you should checkout the code and execute `flutter run` inside the project folder.

### Construction Process

1. I tried to interact with an external API, handle its response and render each element using a ListView. Everything was good!
2. I started interacting with the different widgets and types that Flutter provides trying to understand the best way of solving the exchange issue.
3. My first approach was making use of an Stateful widget and a FutureBuilder, but… I've no reactivity, that pushed me to implement an ObserverPattern [kind of] and I faced another problem… if I use a SetState() the whole view would have rendered again on each "notification" and that is not reactivity.
4. I solved the exchange problem, but I kept facing with the reactivity problem so I started working State Management patterns.
5. I found the previously mentioned tutorial and played a bit with it until I felt confident with the concepts.
6. First at all, I didn't understand how the Cubit works and its own event emit behavior.
7. Finally, I understood how to deal with the state and I procedeed to implement the pattern properly.
8. I made it work! So I procedeed to refactor the whole solution.

#### Things that I would have liked to do

* Improve the UI and its styles
* Research about the testing tools
* Refactor the _ExchangeCubit_ in order to emit the events most efficiently.
* I'm not entirely satisfied with the code from _ExchangeWidget_, even if the code works, I know it is not the best code that can be made.
* I'm not sure if I've chosen the correct _.gitignore_.

*****

Thanks for your time!

Email: [dimodugnojuan](mailto:dimodugnojuan@gmail.com)
