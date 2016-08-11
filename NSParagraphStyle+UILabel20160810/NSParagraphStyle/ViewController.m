//
//  ViewController.m
//  NSParagraphStyle
//
//  Created by 李龙 on 16/8/10.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>

@interface ViewController ()

@end

@implementation ViewController



- (void)demo1{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 150)];
    [label setBackgroundColor:[UIColor orangeColor]];
    [label setTextColor:[UIColor redColor]];
    [label setNumberOfLines:0];
    label.font = [UIFont systemFontOfSize:20];
    NSString *labelText = @"我是内容，我是内容，我是内容，我是内容，我是内容。";
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    
    //-----
    
    paragraphStyle.lineSpacing = 10;// 字体的行间距
//    paragraphStyle.alignment = NSTextAlignmentJustified;//（两端对齐的）文本对齐方式：（左，中，右，两端对齐，自然）
//    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;//结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")
//    paragraphStyle.firstLineHeadIndent = 20.0f;//首行缩进
//    paragraphStyle.headIndent = 20;//整体缩进(首行除外),会盖掉headIndent这个属性
//    paragraphStyle.tailIndent = 20;//相当于右padding?? 可以用来设置显示成竖行的
//    paragraphStyle.minimumLineHeight = 50;//最低行高
//    paragraphStyle.maximumLineHeight = 20;//最大行高
//    paragraphStyle.paragraphSpacing = 15;//段与段之间的间距
//    paragraphStyle.paragraphSpacingBefore = 22.0f;//段首行空白空间/* Distance between the bottom of the previous paragraph (or the end of its paragraphSpacing, if any) and the top of this paragraph. */
    
    //NSWritingDirectionRightToLeft NSWritingDirectionLeftToRight
//    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;//从左到右的书写方向（一共➡️三种）
    
//    paragraphStyle.lineHeightMultiple = 15;/* Natural line height is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. */
//    paragraphStyle.hyphenationFactor = 1;//连字属性 在iOS，唯一支持的值分别为0和1
    
    //-----
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    [self.view addSubview:label];
}




- (void)demo2{
    //NSParagraphStyleAttributeName 段落的风格（设置首行，行间距，对齐方式什么的）看自己需要什么属性，写什么
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10;// 字体的行间距
    paragraphStyle.firstLineHeadIndent = 20.0f;//首行缩进
    paragraphStyle.alignment = NSTextAlignmentJustified;//（两端对齐的）文本对齐方式：（左，中，右，两端对齐，自然）
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;//结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")
    paragraphStyle.headIndent = 20;//整体缩进(首行除外)
    paragraphStyle.tailIndent = 20;//
    paragraphStyle.minimumLineHeight = 10;//最低行高
    paragraphStyle.maximumLineHeight = 20;//最大行高
    paragraphStyle.paragraphSpacing = 15;//段与段之间的间距
    paragraphStyle.paragraphSpacingBefore = 22.0f;//段首行空白空间/* Distance between the bottom of the previous paragraph (or the end of its paragraphSpacing, if any) and the top of this paragraph. */
    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;//从左到右的书写方向（一共➡️三种）
    paragraphStyle.lineHeightMultiple = 15;/* Natural line height is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. */
    paragraphStyle.hyphenationFactor = 1;//连字属性 在iOS，唯一支持的值分别为0和1
    
}





- (void)demo3
{
    [super viewDidLoad];
    //学习内容
    /*
     1.控件 UIView UILabel UITextField UITextView UIButton
     2.字体、大小、单位、颜色
     */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 120)];
    label.text = @"Label Text Content, This is a text label things attribute";//默认为空
    label.font = [UIFont systemFontOfSize:17];//默认使用系统的17
    label.textColor = [UIColor orangeColor];//默认使用文本黑色
    label.shadowColor = [UIColor lightGrayColor];//默认没有阴影
    label.shadowOffset = CGSizeMake(1,0);//默认是一个向上的阴影(0,-1)
    label.textAlignment = NSTextAlignmentCenter;//默认是左对齐
    label.lineBreakMode = NSLineBreakByTruncatingTail;//段落样式，默认是最后截断尾巴，用...代替
    label.backgroundColor = [UIColor greenColor];
    
    //富文本的基本数据类型，属性字符串。以此为基础，如果这个设置了相应的属性，则会忽略上面设置的属性，默认为空
    NSString *string = label.text;
    const CGFloat fontSize = 16.0;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
    NSUInteger length = [string length];
    //设置字体
    UIFont *baseFont = [UIFont systemFontOfSize:fontSize];
    [attrString addAttribute:NSFontAttributeName value:baseFont range:NSMakeRange(0, length)];//设置所有的字体
    UIFont *boldFont = [UIFont boldSystemFontOfSize:fontSize];
    [attrString addAttribute:NSFontAttributeName value:boldFont range:[string rangeOfString:@"Text"]];//设置Text这四个字母的字体为粗体
    //设置倾斜，需要导入coreText
    UIFont *italicFont = GetVariationOfFontWithTrait(baseFont,
                                                     kCTFontTraitItalic);
    [attrString addAttribute:NSFontAttributeName value:italicFont
                       range:[string rangeOfString:@"Label"]];
    // 设置颜色
    UIColor *color = [UIColor redColor];
    [attrString addAttribute:NSForegroundColorAttributeName
                       value:color
                       range:[string rangeOfString:@"Content"]];
    [attrString addAttribute:NSBackgroundColorAttributeName value:[UIColor blueColor] range:[string rangeOfString:@"ent"]];
    
    //可以对这些属性设置值
    //字体名称有以下：
    //    label.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:24];
    [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Verdana-BoldItalic" size:18] range:[string rangeOfString:@"Label"]];
    label.numberOfLines = 2;
    NSMutableParagraphStyle *
    style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineSpacing = 10;//增加行高
    style.headIndent = 10;//头部缩进，相当于左padding
    style.tailIndent = -10;//相当于右padding
    style.lineHeightMultiple = 1.5;//行间距是多少倍
    style.alignment = NSTextAlignmentLeft;//对齐方式
    style.firstLineHeadIndent = 20;//首行头缩进
    style.paragraphSpacing = 10;//段落后面的间距
    style.paragraphSpacingBefore = 20;//段落之前的间距
    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, length)];
    
    [attrString addAttribute:NSKernAttributeName value:@2 range:NSMakeRange(0, length)];//字符间距 2pt
    [attrString addAttribute:NSStrokeColorAttributeName value:[UIColor blueColor] range:[string rangeOfString:@"is"]];//设置文字描边颜色，需要和NSStrokeWidthAttributeName设置描边宽度，这样就能使文字空心
    [attrString addAttribute:NSStrokeWidthAttributeName value:@2 range:[string rangeOfString:@"is"]];//空心字，文字边框描述
    [attrString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:[string rangeOfString:@"text"]];//下划线
    [attrString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleThick) range:[string rangeOfString:@"label"]];//厚的下划线
    [attrString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:[string rangeOfString:@"things"]];//删除线
    [attrString addAttribute:NSStrikethroughColorAttributeName value:[UIColor blueColor] range:[string rangeOfString:@"things"]];//删除线蓝色
    label.attributedText = attrString;
    
    label.highlightedTextColor = [UIColor redColor];//设置文本高亮显示颜色，与highlighted一起使用。
    label.highlighted = NO; //高亮状态是否打开
    label.enabled = YES;//设置文字内容是否可变
    label.userInteractionEnabled = YES;//设置标签是否忽略或移除用户交互。默认为NO
    label.baselineAdjustment = UIBaselineAdjustmentNone;//如果adjustsFontSizeToFitWidth属性设置为YES，这个属性就来控制文本基线的行为。
    //    UIBaselineAdjustmentAlignBaselines=0，默认，文本最上端与中线对齐。
    //    UIBaselineAdjustmentAlignCenters,   文本中线与label中线对齐。
    //    UIBaselineAdjustmentNone,  文本最低端与label中线对齐。;
    [self.view addSubview:label];
    
    /*
     字体名如下：
     Font Family: American Typewriter
     Font: AmericanTypewriter
     Font: AmericanTypewriter-Bold
     
     Font Family: AppleGothic
     Font: AppleGothic
     
     Font Family: Arial
     Font: ArialMT
     Font: Arial-BoldMT
     Font: Arial-BoldItalicMT
     Font: Arial-ItalicMT
     
     Font Family: Arial Rounded MT Bold
     Font: ArialRoundedMTBold
     
     Font Family: Arial Unicode MS
     Font: ArialUnicodeMS
     
     Font Family: Courier
     Font: Courier
     Font: Courier-BoldOblique
     Font: Courier-Oblique
     Font: Courier-Bold
     
     Font Family: Courier New
     Font: CourierNewPS-BoldMT
     Font: CourierNewPS-ItalicMT
     Font: CourierNewPS-BoldItalicMT
     Font: CourierNewPSMT
     
     Font Family: DB LCD Temp
     Font: DBLCDTempBlack
     
     Font Family: Georgia
     Font: Georgia-Bold
     Font: Georgia
     Font: Georgia-BoldItalic
     Font: Georgia-Italic
     
     Font Family: Helvetica
     Font: Helvetica-Oblique
     Font: Helvetica-BoldOblique
     Font: Helvetica
     Font: Helvetica-Bold
     
     Font Family: Helvetica Neue
     Font: HelveticaNeue
     Font: HelveticaNeue-Bold
     
     Font Family: Hiragino Kaku Gothic **** W3
     Font: HiraKakuProN-W3
     
     Font Family: Hiragino Kaku Gothic **** W6
     Font: HiraKakuProN-W6
     
     Font Family: Marker Felt
     Font: MarkerFelt-Thin
     
     Font Family: STHeiti J
     Font: STHeitiJ-Medium
     Font: STHeitiJ-Light
     
     Font Family: STHeiti K
     Font: STHeitiK-Medium
     Font: STHeitiK-Light
     
     Font Family: STHeiti SC
     Font: STHeitiSC-Medium
     Font: STHeitiSC-Light
     
     Font Family: STHeiti TC
     Font: STHeitiTC-Light
     Font: STHeitiTC-Medium
     
     Font Family: Times New Roman
     Font: TimesNewRomanPSMT
     Font: TimesNewRomanPS-BoldMT
     Font: TimesNewRomanPS-BoldItalicMT
     Font: TimesNewRomanPS-ItalicMT
     
     Font Family: Trebuchet MS
     Font: TrebuchetMS-Italic
     Font: TrebuchetMS
     Font: Trebuchet-BoldItalic
     Font: TrebuchetMS-Bold
     
     Font Family: Verdana
     Font: Verdana-Bold
     Font: Verdana-BoldItalic
     Font: Verdana
     Font: Verdana-Italic
     
     Font Family: Zapfino
     Font: Zapfino
     */
    
    //文本对齐方式
    /* Values for NSTextAlignment */
    /*
     NSTextAlignmentLeft 左对齐
     NSTextAlignmentCenter 剧中对齐
     NSTextAlignmentRight 右对齐
     NSTextAlignmentJustified 两端对齐
     NSTextAlignmentNatural 根据显示的文字特性对齐
     */
    
    //段落样式
    /*
     lineSpacing;                         来增加行距
     paragraphSpacing;
     alignment;                           对齐
     firstLineHeadIndent;                 段落开始的缩排像素
     headIndent;                          可调整全部文字的缩排距离，可当作左边 padding 使用
     tailIndent;                          可调整文字尾端的缩排距离。需要注意的是，这里指定的值可以当作文字显示的宽、而也可当作右边 padding 使用，依据输入的正负值而定：
     lineBreakMode;
     minimumLineHeight;
     maximumLineHeight;        而针对不同的字型与字号，我们可以透过指定最大与最小行距（maximumLineHeight 与 minimumLineHeight）来避免过高或过窄的状况发生。
     baseWritingDirection;
     lineHeightMultiple;                  想要调整行距，可以透过搭配使用 lineHeightMultiple 更改行距倍数
     paragraphSpacingBefore; 而若是文章内容有分段落的话，也可以透过指定段落结尾距离（paragraphSpacing）以及段落开头距离（paragraphSpacingBefore）:
     hyphenationFactor;
     @property(readwrite,copy,NS_NONATOMIC_IOSONLY) NSArray *tabStops NS_AVAILABLE_IOS(7_0);
     @property(readwrite,NS_NONATOMIC_IOSONLY) CGFloat defaultTabInterval NS_AVAILABLE_IOS(7_0);
     */
    
    /* Predefined character attributes for text. If the key is not in the dictionary, then use the default values as described below.  //预定义的文本属性值，如果键不是一个字典，那么使用默认的值作为以下描述
     NSFontAttributeName 字体 默认是Helvetica 12号
     NSParagraphStyleAttributeName 段落样式
     */
    
    /*
     UIKIT_EXTERN NSString *const  NS_AVAILABLE_IOS(6_0);      // NSParagraphStyle, default defaultParagraphStyle
     UIKIT_EXTERN NSString *const NSForegroundColorAttributeName NS_AVAILABLE_IOS(6_0);     // UIColor, default blackColor
     UIKIT_EXTERN NSString *const NSBackgroundColorAttributeName NS_AVAILABLE_IOS(6_0);     // UIColor, default nil: no background
     UIKIT_EXTERN NSString *const NSLigatureAttributeName NS_AVAILABLE_IOS(6_0);            // NSNumber containing integer, default 1: default ligatures, 0: no ligatures
     UIKIT_EXTERN NSString *const NSKernAttributeName NS_AVAILABLE_IOS(6_0);                // NSNumber containing floating point value, in points; amount to modify default kerning. 0 means kerning is disabled. (note: values other than nil and 0 are unsupported on iOS)
     UIKIT_EXTERN NSString *const NSStrikethroughStyleAttributeName NS_AVAILABLE_IOS(6_0);  // NSNumber containing integer, default 0: no strikethrough
     UIKIT_EXTERN NSString *const NSUnderlineStyleAttributeName NS_AVAILABLE_IOS(6_0);      // NSNumber containing integer, default 0: no underline
     UIKIT_EXTERN NSString *const NSStrokeColorAttributeName NS_AVAILABLE_IOS(6_0);         // UIColor, default nil: same as foreground color
     UIKIT_EXTERN NSString *const NSStrokeWidthAttributeName NS_AVAILABLE_IOS(6_0);         // NSNumber containing floating point value, in percent of font point size, default 0: no stroke; positive for stroke alone, negative for stroke and fill (a typical value for outlined text would be 3.0)
     UIKIT_EXTERN NSString *const NSShadowAttributeName NS_AVAILABLE_IOS(6_0);              // NSShadow, default nil: no shadow
     UIKIT_EXTERN NSString *const NSTextEffectAttributeName NS_AVAILABLE_IOS(7_0);          // NSString, default nil: no text effect
     
     UIKIT_EXTERN NSString *const NSAttachmentAttributeName NS_AVAILABLE_IOS(7_0);          // NSTextAttachment, default nil
     UIKIT_EXTERN NSString *const NSLinkAttributeName NS_AVAILABLE_IOS(7_0);                // NSURL (preferred) or NSString
     UIKIT_EXTERN NSString *const NSBaselineOffsetAttributeName NS_AVAILABLE_IOS(7_0);      // NSNumber containing floating point value, in points; offset from baseline, default 0
     UIKIT_EXTERN NSString *const NSUnderlineColorAttributeName NS_AVAILABLE_IOS(7_0);      // UIColor, default nil: same as foreground color
     UIKIT_EXTERN NSString *const NSStrikethroughColorAttributeName NS_AVAILABLE_IOS(7_0);  // UIColor, default nil: same as foreground color
     UIKIT_EXTERN NSString *const NSObliquenessAttributeName NS_AVAILABLE_IOS(7_0);         // NSNumber containing floating point value; skew to be applied to glyphs, default 0: no skew
     UIKIT_EXTERN NSString *const NSExpansionAttributeName NS_AVAILABLE_IOS(7_0);           // NSNumber containing floating point value; log of expansion factor to be applied to glyphs, default 0: no expansion
     
     UIKIT_EXTERN NSString *const NSWritingDirectionAttributeName NS_AVAILABLE_IOS(7_0);    // NSArray of NSNumbers representing the nested levels of writing direction overrides as defined by Unicode LRE, RLE, LRO, and RLO characters.  The control characters can be obtained by masking NSWritingDirection and NSTextWritingDirection values.  LRE: NSWritingDirectionLeftToRight|NSTextWritingDirectionEmbedding, RLE: NSWritingDirectionRightToLeft|NSTextWritingDirectionEmbedding, LRO: NSWritingDirectionLeftToRight|NSTextWritingDirectionOverride, RLO: NSWritingDirectionRightToLeft|NSTextWritingDirectionOverride,
     
     UIKIT_EXTERN NSString *const NSVerticalGlyphFormAttributeName NS_AVAILABLE_IOS(6_0);   // An NSNumber containing an integer value.  0 means horizontal text.  1 indicates vertical text.  If not specified, it could follow higher-level vertical orientation settings.  Currently on iOS, it's always horizontal.  The behavior for any other value is undefined.
     */
    
    // NSParagraphStyle  段落样式
    //    typedef NS_ENUM(NSInteger, NSLineBreakMode) {		/* What to do with long lines */ //对于长内容或多行内容的处理方式
    //        NSLineBreakByWordWrapping = 0,     	/* Wrap at word boundaries, default */   //按包含单词为界限截断
    //        NSLineBreakByCharWrapping,		/* Wrap at character boundaries */           //按字符为界限截断
    //        NSLineBreakByClipping,		/* Simply clip */                                //简单的修剪
    //        NSLineBreakByTruncatingHead,	/* Truncate at head of line: "...wxyz" */        //截断头部
    //        NSLineBreakByTruncatingTail,	/* Truncate at tail of line: "abcd..." */        //截断尾巴
    //        NSLineBreakByTruncatingMiddle	/* Truncate middle of line:  "ab...yz" */        //截断中间
    //    } NS_ENUM_AVAILABLE_IOS(6_0);
}

//获取斜体
UIFont * GetVariationOfFontWithTrait(UIFont *baseFont,
                                     CTFontSymbolicTraits trait) {
    CGFloat fontSize = [baseFont pointSize];
    CFStringRef baseFontName = (__bridge CFStringRef)[baseFont fontName];
    CTFontRef baseCTFont = CTFontCreateWithName(baseFontName,
                                                fontSize, NULL);
    CTFontRef ctFont =
    CTFontCreateCopyWithSymbolicTraits(baseCTFont, 0, NULL,
                                       trait, trait);
    NSString *variantFontName =
    CFBridgingRelease(CTFontCopyName(ctFont,
                                     kCTFontPostScriptNameKey));
    
    UIFont *variantFont = [UIFont fontWithName:variantFontName
                                          size:fontSize];
    CFRelease(ctFont);
    CFRelease(baseCTFont);
    return variantFont;
};




- (void)demo4{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 130, 300, 80)];
    label.font = [UIFont systemFontOfSize:17];//默认使用系统的17
    label.backgroundColor = [UIColor lightGrayColor];

    
    NSDictionary*attributes =@{NSForegroundColorAttributeName: [UIColor redColor],
                               NSFontAttributeName: [UIFont fontWithName:@"Zapfino"size:16.0]
                               };
    NSString *strDisplayText =@"This is an attributed string.";
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:strDisplayText attributes:attributes];
    label.attributedText= attributedText;
    
    [self.view addSubview:label];
}


- (void)demo5{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 300, 100)];
    label.font = [UIFont systemFontOfSize:17];//默认使用系统
    
    NSDictionary *attributes1 =@{
                                NSBackgroundColorAttributeName: [UIColor orangeColor],
                                NSFontAttributeName: [UIFont fontWithName:@"Zapfino"size:22.0],
                                NSKernAttributeName: @-1.0
                                };
    NSString *strDisplayText1 =@"Orange Background";
    NSAttributedString *attributedText1 = [[NSAttributedString alloc]initWithString:strDisplayText1 attributes:attributes1];
    label.attributedText= attributedText1;
    
    [self.view addSubview:label];
}



- (void)demo6{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 290, 300, 40)];
    label.font = [UIFont systemFontOfSize:17];//默认使用系统
    label.backgroundColor = [UIColor cyanColor];
    
    NSShadow*shadow = [[NSShadow alloc] init];
    shadow.shadowColor= [UIColor greenColor];
    shadow.shadowBlurRadius=5.0;
    shadow.shadowOffset=CGSizeMake(1.0,1.0);
    
    
    NSDictionary *attributes2 =@{
                                NSUnderlineStyleAttributeName:@1,
                                NSShadowAttributeName: shadow
                                };
    NSString *strDisplayText2 =@"Shadow Font";
    NSAttributedString *attributedText2 = [[NSAttributedString alloc] initWithString:strDisplayText2 attributes:attributes2];
    label.attributedText= attributedText2;
    
    
    [self.view addSubview:label];
}



- (void)demo7{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 320, 300, 80)];
    label.font = [UIFont systemFontOfSize:17];//默认使用系统
    label.backgroundColor = [UIColor lightGrayColor];
    
    NSDictionary*subStrAttribute1 =@{
                                     NSForegroundColorAttributeName: [UIColor redColor],
                                     NSStrikethroughStyleAttributeName:@2
                                     };
    NSDictionary*subStrAttribute2 =@{
                                     NSForegroundColorAttributeName: [UIColor greenColor]
                                     };
    NSString *strDisplayText3 =@"Red and Green";
    NSMutableAttributedString*attributedText3 = [[NSMutableAttributedString alloc]initWithString:strDisplayText3];
    [attributedText3 setAttributes:subStrAttribute1 range:NSMakeRange(0,3)];
    [attributedText3 setAttributes:subStrAttribute2 range:NSMakeRange(8,5)];
    label.attributedText= attributedText3;
    
    [self.view addSubview:label];
}



- (void)demo8{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 390, 300, 120)];
    label.font = [UIFont systemFontOfSize:17];//默认使用系统
    
    
    
    [self.view addSubview:label];
}



- (void)demo9{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 390, 300, 120)];
    label.font = [UIFont systemFontOfSize:17];//默认使用系统
    
    
    
    [self.view addSubview:label];
}



- (void)demo10{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 390, 300, 120)];
    label.font = [UIFont systemFontOfSize:17];//默认使用系统
    
    
    
    [self.view addSubview:label];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self demo1];
    //    [self demo2];
    [self demo3];
    [self demo4];
    [self demo5];
    [self demo6];
    [self demo7];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
