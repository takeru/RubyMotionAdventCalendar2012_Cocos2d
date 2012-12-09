#class AppDelegate
#  def application(application, didFinishLaunchingWithOptions:launchOptions)
#    true
#  end
#end

class AppDelegate < Cocos2dAppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    super

    @scene = MainScene.node
    director.pushScene @scene

    true
  end

  
  #def shouldAutorotateToInterfaceOrientation(orientation)
  #  [UIInterfaceOrientationPortrait,
  #   UIInterfaceOrientationPortraitUpsideDown,
  #   UIInterfaceOrientationLandscapeLeft,
  #   UIInterfaceOrientationLandscapeRight].include?(orientation)
  #end
end

class MainScene < CCLayer
  def init
    super
    p "MainScene#init"
    self.scheduleUpdate
    self
  end

  def onEnter
    super
    p "MainScene#onEnter"
    self.initMenu
  end

  def onExit
    super
    p "MainScene#onExit"
  end

  def update(dt)
    super
    # p "MainScene#update(#{dt})"
  end

  def initMenu
    item1 = CCMenuItemImage.itemWithNormalImage "item1a.png", selectedImage:"item1b.png", disabledImage:"item1c.png", target:self, selector: 'menuSelected:'

    sp2a  = CCSprite.spriteWithFile "item2a.png"
    sp2b  = CCSprite.spriteWithFile "item2b.png"
    sp2c  = CCSprite.spriteWithFile "item2c.png"
    item2 = CCMenuItemSprite.itemWithNormalSprite sp2a, selectedSprite:sp2b, disabledSprite:sp2c, target:self, selector: 'menuSelected:'

    lb3   = CCLabelTTF.labelWithString:"Let's Go!", fontName:"Arial", fontSize:50
    lb3.color = [0,127,0]
    item3 = CCMenuItemLabel.itemWithLabel lb3, target:self, selector: 'menuSelected:'

    lb4   = CCLabelTTF.labelWithString:"Jump!", fontName:"Marker Felt", fontSize:32
    lb4.color = [0,0,255]
    item4 = CCMenuItemLabel.itemWithLabel(lb4, block:lambda{|sender| puts "lambda@Item4 #{sender.inspect}" })

    menu = CCMenu.menuWithArray [item1, item2, item3, item4]
    #menu.position = [0,0]
    menu.alignItemsVertically
    self.addChild menu, z:1
  end

  def menuSelected(sender)
    puts "menuSelected #{sender.inspect}"
  end
end
