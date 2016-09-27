#import "NSAttributedString+PRMStyles.h"

@implementation NSAttributedString (PRMStyles)

+ (NSDictionary<NSString *, id> *)prmTitleAttributes
{
    return @{
             NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleTitle1],
             NSForegroundColorAttributeName: [UIColor darkGrayColor]
             };
}

+ (NSDictionary<NSString *, id> *)prmBodyAttributes
{
    return @{
             NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleBody],
             NSForegroundColorAttributeName: [UIColor grayColor]
             };
}

@end
