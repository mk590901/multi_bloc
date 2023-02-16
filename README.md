# multi_bloc

Flutter in action. BloC

## Introduction

BLoC in relation to flutter involves the use in GUI approaches related to the state machines. This is evidenced by the terminology: events, states, transactions & etc, and, of course, ready-made implementation at the package level dart_bloc and flutter_bloc.

On the Internet you can find a lot of technical information about BLoC. However, for an ordinary programmer, only real implementations are of interest. I found only two articles from which you can learn something useful:

1) https://itnext.io/flutter-blocs-at-scale-1-the-state-machine-fce5f086d7b9 
2) https://medium.com/flutter-community/flutter-bloc-for-beginners-839e22adb9f5

The first article in a more or less sane form explains why BLoC is worth using, and the second one shows a complete application using BloC.

The only thing that surprised me in these articles, and in all the others that I found on the Internet and in the documentation, was that BLoC initially lack a way to describe the state machine in a simple sane form. The transition logic is described mostly in events and scattered throughout the code and this makes it difficult to implement and understand the code.

I decided to fill this gap and try to use the approach that I have repeatedly used earlier when writing my applications, if I needed to use flat state machines. I just added to the BLoC class a reference to a class that describes the of state machine and implements transitions from state to state and connected the events of BLoC with the events of the FSM.

So, I decided to implement account manager using BLoC. I.e. create a system that allows you to register a user, perform login and logout, unregister, and also update user data if he is logged in. In general, everything that is described in this article: https://itnext.io/flutter-blocs-at-scale-1-the-state-machine-fce5f086d7b9. The only remark: I didn't copy the approach presented in the article one-to-one. However, the meaning of what I did completely fits into the principles outlined in the article. Well, maybe with a few exceptions connected to temporary states.

## Brief description of the application

The Account manager is represented by a mock AccountManager that implements the register, unregister, login, logout and refresh operations. An element of chance has been added: any operation can end both successfully and erroneously.
The AccountBloc class implements operations with the Account manager, the ActionBloc class intent the visualisation of completing these operations. Relevant widgets: AccountStatesPanelWidget and ActionsPanelWidget.

## Chart describing the state machine for account management

![image](https://user-images.githubusercontent.com/125393245/219486404-8f9fb01e-a73c-4b18-84b3-cf8039934b02.png)

## Class describing the state machine for account management

I omit the implementation details, the code can be found in the repository, but trust that the create method in the AccountStateMachine class unambiguously describes the state machine depicted in the chart above.

## Chart describing the state machine for account actions

![image](https://user-images.githubusercontent.com/125393245/219486636-2a73f79e-367f-4d3f-b360-bbb5f3628fe4.png)

## Class describing the state machine for account actions

Create method in the ActionStateMachine class describes the state machine depicted in the chart above.


## Media file


https://user-images.githubusercontent.com/125393245/219485989-8cb06023-1255-4748-969a-1bf3e578deb4.mp4


