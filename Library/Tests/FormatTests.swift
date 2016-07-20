import XCTest
import KsApi
@testable import Library

// swiftlint:disable function_body_length
final class FormatTests: XCTestCase {

  func testWholeNumber() {
    withEnvironment(locale: NSLocale(localeIdentifier: "en")) {
      XCTAssertEqual(Format.wholeNumber(10), "10")
      XCTAssertEqual(Format.wholeNumber(100), "100")
      XCTAssertEqual(Format.wholeNumber(1_000), "1,000")
      XCTAssertEqual(Format.wholeNumber(10_000), "10,000")
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "es")) {
      XCTAssertEqual(Format.wholeNumber(10), "10")
      XCTAssertEqual(Format.wholeNumber(100), "100")
      XCTAssertEqual(Format.wholeNumber(1_000), "1.000")
      XCTAssertEqual(Format.wholeNumber(10_000), "10.000")
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "fr")) {
      XCTAssertEqual(Format.wholeNumber(10), "10")
      XCTAssertEqual(Format.wholeNumber(100), "100")
      XCTAssertEqual(Format.wholeNumber(1_000), "1 000")
      XCTAssertEqual(Format.wholeNumber(10_000), "10 000")
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "de")) {
      XCTAssertEqual(Format.wholeNumber(10), "10")
      XCTAssertEqual(Format.wholeNumber(100), "100")
      XCTAssertEqual(Format.wholeNumber(1_000), "1.000")
      XCTAssertEqual(Format.wholeNumber(10_000), "10.000")
    }
  }

  func testPercentages() {

    withEnvironment(locale: NSLocale(localeIdentifier: "en")) {
      XCTAssertEqual(Format.percentage(50), "50%")
      XCTAssertEqual(Format.percentage(1_000), "1,000%")
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "es")) {
      XCTAssertEqual(Format.percentage(50), "50 %")
      XCTAssertEqual(Format.percentage(1_000), "1.000 %")
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "fr")) {
      XCTAssertEqual(Format.percentage(50), "50 %")
      XCTAssertEqual(Format.percentage(1_000), "1 000 %")
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "de")) {
      XCTAssertEqual(Format.percentage(50), "50 %")
      XCTAssertEqual(Format.percentage(1_000), "1.000 %")
    }
  }

  func testPercentageFromDouble() {
    withEnvironment(locale: NSLocale(localeIdentifier: "en")) {
      XCTAssertEqual(Format.percentage(0.532), "53%")
      XCTAssertEqual(Format.percentage(10.66), "1,066%")
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "es")) {
      XCTAssertEqual(Format.percentage(0.532), "53 %")
      XCTAssertEqual(Format.percentage(10.66), "1.066 %")
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "fr")) {
      XCTAssertEqual(Format.percentage(0.532), "53 %")
      XCTAssertEqual(Format.percentage(10.66), "1 066 %")
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "de")) {
      XCTAssertEqual(Format.percentage(0.532), "53 %")
      XCTAssertEqual(Format.percentage(10.66), "1.066 %")
    }
  }

  func testCurrency() {
    withEnvironment(locale: NSLocale(localeIdentifier: "en")) {
      withEnvironment(countryCode: "US") {
        XCTAssertEqual(Format.currency(1_000, country: .US), "$1,000")
        XCTAssertEqual(Format.currency(1_000, country: .CA), "$1,000 CAD")
        XCTAssertEqual(Format.currency(1_000, country: .GB), "£1,000")
        XCTAssertEqual(Format.currency(1_000, country: .DK), "kr1,000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .DE), "€1,000")
      }

      withEnvironment(countryCode: "CA") {
        XCTAssertEqual(Format.currency(1_000, country: .US), "$1,000 USD")
        XCTAssertEqual(Format.currency(1_000, country: .CA), "$1,000 CAD")
        XCTAssertEqual(Format.currency(1_000, country: .GB), "£1,000")
        XCTAssertEqual(Format.currency(1_000, country: .DK), "kr1,000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .DE), "€1,000")
      }

      withEnvironment(countryCode: "GB") {
        XCTAssertEqual(Format.currency(1_000, country: .US), "$1,000 USD")
        XCTAssertEqual(Format.currency(1_000, country: .CA), "$1,000 CAD")
        XCTAssertEqual(Format.currency(1_000, country: .GB), "£1,000")
        XCTAssertEqual(Format.currency(1_000, country: .DK), "kr1,000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .DE), "€1,000")
      }
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "es")) {
      withEnvironment(countryCode: "US") {
        XCTAssertEqual(Format.currency(1_000, country: .US), "1.000 $")
        XCTAssertEqual(Format.currency(1_000, country: .CA), "1.000 $ CAD")
        XCTAssertEqual(Format.currency(1_000, country: .GB), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .DK), "1.000 kr DKK")
        XCTAssertEqual(Format.currency(1_000, country: .DE), "1.000 €")
      }

      withEnvironment(countryCode: "CA") {
        XCTAssertEqual(Format.currency(1_000, country: .US), "1.000 $ USD")
        XCTAssertEqual(Format.currency(1_000, country: .CA), "1.000 $ CAD")
        XCTAssertEqual(Format.currency(1_000, country: .GB), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .DK), "1.000 kr DKK")
        XCTAssertEqual(Format.currency(1_000, country: .DE), "1.000 €")
      }

      withEnvironment(countryCode: "GB") {
        XCTAssertEqual(Format.currency(1_000, country: .US), "1.000 $ USD")
        XCTAssertEqual(Format.currency(1_000, country: .CA), "1.000 $ CAD")
        XCTAssertEqual(Format.currency(1_000, country: .GB), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .DK), "1.000 kr DKK")
        XCTAssertEqual(Format.currency(1_000, country: .DE), "1.000 €")
      }
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "fr")) {
      withEnvironment(countryCode: "US") {
        XCTAssertEqual(Format.currency(1_000, country: .US), "1 000 $")
        XCTAssertEqual(Format.currency(1_000, country: .CA), "1 000 $ CAD")
        XCTAssertEqual(Format.currency(1_000, country: .GB), "1 000 £")
        XCTAssertEqual(Format.currency(1_000, country: .DK), "1 000 kr DKK")
        XCTAssertEqual(Format.currency(1_000, country: .DE), "1 000 €")
      }

      withEnvironment(countryCode: "CA") {
        XCTAssertEqual(Format.currency(1_000, country: .US), "1 000 $ USD")
        XCTAssertEqual(Format.currency(1_000, country: .CA), "1 000 $ CAD")
        XCTAssertEqual(Format.currency(1_000, country: .GB), "1 000 £")
        XCTAssertEqual(Format.currency(1_000, country: .DK), "1 000 kr DKK")
        XCTAssertEqual(Format.currency(1_000, country: .DE), "1 000 €")
      }

      withEnvironment(countryCode: "GB") {
        XCTAssertEqual(Format.currency(1_000, country: .US), "1 000 $ USD")
        XCTAssertEqual(Format.currency(1_000, country: .CA), "1 000 $ CAD")
        XCTAssertEqual(Format.currency(1_000, country: .GB), "1 000 £")
        XCTAssertEqual(Format.currency(1_000, country: .DK), "1 000 kr DKK")
        XCTAssertEqual(Format.currency(1_000, country: .DE), "1 000 €")
      }
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "de")) {
      withEnvironment(countryCode: "US") {
        XCTAssertEqual(Format.currency(1_000, country: .US), "1.000 $")
        XCTAssertEqual(Format.currency(1_000, country: .CA), "1.000 $ CAD")
        XCTAssertEqual(Format.currency(1_000, country: .GB), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .DK), "1.000 kr DKK")
        XCTAssertEqual(Format.currency(1_000, country: .DE), "1.000 €")
      }

      withEnvironment(countryCode: "CA") {
        XCTAssertEqual(Format.currency(1_000, country: .US), "1.000 $ USD")
        XCTAssertEqual(Format.currency(1_000, country: .CA), "1.000 $ CAD")
        XCTAssertEqual(Format.currency(1_000, country: .GB), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .DK), "1.000 kr DKK")
        XCTAssertEqual(Format.currency(1_000, country: .DE), "1.000 €")
      }

      withEnvironment(countryCode: "GB") {
        XCTAssertEqual(Format.currency(1_000, country: .US), "1.000 $ USD")
        XCTAssertEqual(Format.currency(1_000, country: .CA), "1.000 $ CAD")
        XCTAssertEqual(Format.currency(1_000, country: .GB), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .DK), "1.000 kr DKK")
        XCTAssertEqual(Format.currency(1_000, country: .DE), "1.000 €")
      }
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "dk")) {
      withEnvironment(countryCode: "DK") {
        XCTAssertEqual(Format.currency(1_000, country: .US), "$ 1000 USD")
        XCTAssertEqual(Format.currency(1_000, country: .CA), "$ 1000 CAD")
        XCTAssertEqual(Format.currency(1_000, country: .GB), "£ 1000")
        XCTAssertEqual(Format.currency(1_000, country: .DK), "kr 1000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .DE), "€ 1000")
      }
    }
  }

  func testDate() {
    let date = 434592000.0 // Oct 10 1983 in UTC
    let UTC = NSTimeZone(abbreviation: "UTC")!
    let EST = NSTimeZone(abbreviation: "EST")!

    withEnvironment(locale: NSLocale(localeIdentifier: "en")) {
      withEnvironment(timeZone: UTC) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "Oct 10, 1983, 12:00:00 AM")
      }

      withEnvironment(timeZone: EST) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "Oct 9, 1983, 8:00:00 PM")
      }
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "de")) {
      withEnvironment(timeZone: UTC) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "10.10.1983, 00:00:00")
      }
      withEnvironment(timeZone: EST) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "09.10.1983, 20:00:00")
      }
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "es")) {
      withEnvironment(timeZone: UTC) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "10 oct 1983 0:00:00")
      }
      withEnvironment(timeZone: EST) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "9 oct 1983 20:00:00")
      }
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "fr")) {
      withEnvironment(timeZone: UTC) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "10 oct. 1983 00:00:00")
      }
      withEnvironment(timeZone: EST) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "9 oct. 1983 20:00:00")
      }
    }
  }

  func testDuration() {
    let threshold = 30
    let inMinutes = NSDate().timeIntervalSince1970 + 61 * 2
    let inHours = NSDate().timeIntervalSince1970 + 60 * 61 * 2
    let inDays = NSDate().timeIntervalSince1970 + 60 * 61 * 24 * 2
    let pastThreshold = NSDate().timeIntervalSince1970 + 60 * 61 * 24 * Double(threshold + 1)

    withEnvironment(locale: NSLocale(localeIdentifier: "en"), language: .en) {
      XCTAssertEqual("2 minutes", Format.duration(secondsInUTC: inMinutes))
      XCTAssertEqual("2 hours", Format.duration(secondsInUTC: inHours))
      XCTAssertEqual("2 days", Format.duration(secondsInUTC: inDays))
      XCTAssertNil(Format.duration(secondsInUTC: pastThreshold))
      XCTAssertNil(Format.duration(secondsInUTC: pastThreshold, thresholdInDays: threshold))
    }
  }

  func testRelative() {
    AppEnvironment.replaceCurrentEnvironment(mainBundle: MockBundle())

    let justNow = NSDate().timeIntervalSince1970 - 30
    let rightNow = NSDate().timeIntervalSince1970 + 31
    let minutesAgo = NSDate().timeIntervalSince1970 - 60 * 30
    let inMinutes = NSDate().timeIntervalSince1970 + 60 * 31
    let hoursAgo = NSDate().timeIntervalSince1970 - 60 * 60
    let inHours = NSDate().timeIntervalSince1970 + 60 * 61
    let yesterday = NSDate().timeIntervalSince1970 - 60 * 60 * 24
    let tomorrow = NSDate().timeIntervalSince1970 + 60 * 61 * 24
    let daysAgo = NSDate().timeIntervalSince1970 - 60 * 60 * 24 * 2
    let inDays = NSDate().timeIntervalSince1970 + 60 * 61 * 24 * 2
    let awhileAgo = NSDate().timeIntervalSince1970 - 60 * 60 * 24 * 31
    let inAwhile = NSDate().timeIntervalSince1970 - 60 * 60 * 24 * 32

    withEnvironment(locale: NSLocale(localeIdentifier: "en"), language: .en) {
      XCTAssertEqual("just now", Format.relative(secondsInUTC: justNow))
      XCTAssertEqual("right now", Format.relative(secondsInUTC: rightNow))
      XCTAssertEqual("30 minutes ago", Format.relative(secondsInUTC: minutesAgo))
      XCTAssertEqual("in 30 minutes", Format.relative(secondsInUTC: inMinutes))
      XCTAssertEqual("1 hour ago", Format.relative(secondsInUTC: hoursAgo))
      XCTAssertEqual("in 1 hours", Format.relative(secondsInUTC: inHours))
      XCTAssertEqual("yesterday", Format.relative(secondsInUTC: yesterday))
      XCTAssertEqual("in 1 days", Format.relative(secondsInUTC: tomorrow))
      XCTAssertEqual("2 days ago", Format.relative(secondsInUTC: daysAgo))
      XCTAssertEqual("in 2 days", Format.relative(secondsInUTC: inDays))
      XCTAssertEqual(Format.date(secondsInUTC: awhileAgo, timeStyle: .NoStyle),
                     Format.relative(secondsInUTC: awhileAgo))
      XCTAssertEqual(Format.date(secondsInUTC: inAwhile, timeStyle: .NoStyle),
                     Format.relative(secondsInUTC: inAwhile))

      XCTAssertEqual("just now", Format.relative(secondsInUTC: justNow, abbreviate: true))
      XCTAssertEqual("right now", Format.relative(secondsInUTC: rightNow, abbreviate: true))
      XCTAssertEqual("30 mins ago", Format.relative(secondsInUTC: minutesAgo, abbreviate: true))
      XCTAssertEqual("in 30 mins", Format.relative(secondsInUTC: inMinutes, abbreviate: true))
      XCTAssertEqual("1 hr ago", Format.relative(secondsInUTC: hoursAgo, abbreviate: true))
      XCTAssertEqual("in 1 hrs", Format.relative(secondsInUTC: inHours, abbreviate: true))
      XCTAssertEqual("yesterday", Format.relative(secondsInUTC: yesterday, abbreviate: true))
      XCTAssertEqual("in 1 days", Format.relative(secondsInUTC: tomorrow, abbreviate: true))
      XCTAssertEqual("2 days ago", Format.relative(secondsInUTC: daysAgo, abbreviate: true))
      XCTAssertEqual("in 2 days", Format.relative(secondsInUTC: inDays, abbreviate: true))
      XCTAssertEqual(Format.date(secondsInUTC: awhileAgo, timeStyle: .NoStyle),
                     Format.relative(secondsInUTC: awhileAgo, abbreviate: true))
      XCTAssertEqual(Format.date(secondsInUTC: inAwhile, timeStyle: .NoStyle),
                     Format.relative(secondsInUTC: inAwhile, abbreviate: true))
    }

    withEnvironment(locale: NSLocale(localeIdentifier: "de"), language: .de) {
      XCTAssertEqual("vor 1 Stunde", Format.relative(secondsInUTC: hoursAgo))
      XCTAssertEqual("vor 1 Std", Format.relative(secondsInUTC: hoursAgo, abbreviate: true))
    }
  }
}
