class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  
    @quizController = QuizController.alloc.init
    @quizController.tabBarItem.title = 'Pistol Safety'
    @quizController.tabBarItem.image = UIImage.imageNamed('quiz.png')
    @quizController.navigationItem.title = 'Pistol Safety'
    @quizController.window = @window

    @infoController = InfoController.alloc.init
    @infoController.tabBarItem.title = 'Buying Process'
    @infoController.tabBarItem.image = UIImage.imageNamed('info.png')
    @infoController.navigationItem.title = 'Buying Process'
    @infoController.window = @window

    tabbar = UITabBarController.alloc.init
    tabbar.viewControllers = [@quizController,@infoController]
    tabbar.selectedIndex = 0

    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(tabbar)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

    @quizController.tabbar = tabbar 
  end
end
