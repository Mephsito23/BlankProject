//

//

#import <UIKit/UIKit.h>

@class LCActionSheet;

@protocol LCActionSheetDelegate <NSObject>

@optional

/**
 *  点击了 buttonIndex处 的按钮
 */
- (void)actionSheet:(LCActionSheet *)actionSheet didClickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface LCActionSheet : UIView

/**
 *  返回一个 ActionSheet 对象, 类方法
 *
 *  @param title 提示标题
 *
 *  @param titles 所有按钮的标题
 *
 *  @param redButtonIndex 红色按钮的index
 *
 *  @param delegate 代理
 *
 *  Tip: 如果没有红色按钮, redButtonIndex 给 `-1` 即可
 */
+ (instancetype)sheetWithTitle:(NSString *)title
                  buttonTitles:(NSArray *)titles
                     buttonImgs:(NSArray *)images
                redButtonIndex:(NSInteger)buttonIndex
                      delegate:(id<LCActionSheetDelegate>)delegate;

/**
 *  返回一个 ActionSheet 对象, 实例方法
 *
 *  @param title 提示标题
 *
 *  @param titles 所有按钮的标题
 *
 *  @param redButtonIndex 红色按钮的index
 *
 *  @param delegate 代理
 *
 *  Tip: 如果没有红色按钮, redButtonIndex 给 `-1` 即可
 */
- (instancetype)initWithTitle:(NSString *)title
                 buttonTitles:(NSArray *)titles
                   buttonImgs:(NSArray *)images
               redButtonIndex:(NSInteger)buttonIndex
                     delegate:(id<LCActionSheetDelegate>)delegate;

/**
 *  显示 ActionSheet
 */
- (void)show;

@end
