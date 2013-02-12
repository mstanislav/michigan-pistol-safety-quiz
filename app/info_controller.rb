class InfoController < UIViewController
  attr_accessor :window

  def loadView
    self.view = UIView.alloc.init
    self.view.backgroundColor = UIColor.blackColor

    title = UILabel.new                                                                                        
    title.font = UIFont.systemFontOfSize(22)                                                                   
    title.textColor = UIColor.whiteColor
    title.backgroundColor = UIColor.clearColor                                                                 
    title.lineBreakMode = UILineBreakModeWordWrap                                                              
    title.textAlignment = NSTextAlignmentCenter
    title.numberOfLines = 0 
    title.frame = [[5, 5], [315, 30]]                                               
    title.text = "Buying Process"

    view.addSubview title

    content = UILabel.new                                                                                          
    content.font = UIFont.systemFontOfSize(14)                                                                     
    content.textColor = UIColor.whiteColor
    content.backgroundColor = UIColor.clearColor                                                                   
    content.lineBreakMode = UILineBreakModeWordWrap                                                             
    content.numberOfLines = 0 
    content.frame = [[5, 40], [315, 100]]
    content.text =  "If you do not have your CPL, you must visit your local police or sheriff's department to receive your 'License to Purchase a Pistol' "
    content.text += "prior to receiving the pistol. In order to get a 10-day Handgun Purchase Permit (TDHPP), you have to be at least 18 years of age.\n\n" 
    content.text += "Depending on your law enforcement agency, they may require you to take the Basic Pistol Safety Questionaire and pass it with "
    content.text += "a 70% or better. You'll also have to swear before a notary that you are legally allowed to make such an acquisition.\n\n"
    content.text += "If you're 21, you may then purchase a pistol from a Federal Firearms Licensee (FFL) or if you're under 21, buy from a private seller. "
    content.text += "Be sure to remit the appropriate signed paperwork back to your law enforcement entity and have them present you a 'Safety Inspection Certificate'."
    content.sizeToFit

    view.addSubview content                                                                                      
  end
end
