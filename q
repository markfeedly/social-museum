commit baaab75e28985cacde0883180bad350411879022
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 11 17:12:41 2014 +0100

    Removed redundant comment ID, stopped links being built manually, reverted admin? to can_read? where appropriate.

commit 6ffb1ec8374d9238e3a15c591f81d117de54451e
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Aug 11 16:53:31 2014 +0100

    put a recent menu item in the header

commit 4e1ccc29cd4dc7e4edfb185e67623aa17c18b464
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 11 16:41:29 2014 +0100

    Display icons for archive and doc types, restructuring in uploaders, using guard gems

commit 53ba16865370df0d6d5f275e2f1732de1d85c2c9
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Aug 11 16:11:03 2014 +0100

    added a recent (creations and edits) page

commit 14fa7cb86b90ac01bc747dfd21045841c012403b
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 11 14:16:15 2014 +0100

    Added archive support and fixed bug in getting mime type that uploader can handle

commit c311e17ce10fafb4392fc47ad19c661febe4e102
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 11 13:55:13 2014 +0100

    Added image support for uploads

commit 40547b18c08efa7702a8446743433e60bb3593b0
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 11 13:47:28 2014 +0100

    Added PDF acceptance

commit b7cba15942c9427b408ef380460754ec3db4aa8e
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 11 13:45:37 2014 +0100

    Uploads done for microsoft and open office, potentially add thumbnail / briefcase icon

commit 4c3ecd266ae2f49fe9d8bc018b519b1e2c17c125
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 8 17:34:35 2014 +0100

    Updated rspec version

commit 2228233432639f5a18b2046dcc1e9a34ae22226b
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 8 17:31:49 2014 +0100

    Removed deprecations from rspec

commit 1d401ba4dafa3960f10575e13d4768d7baec1aac
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 8 17:19:22 2014 +0100

    Removed deprecated be_bool

commit fce232c6e39f877738dec863c7b43b520213342e
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 8 17:12:34 2014 +0100

    Added error handling on invalid uploads

commit 5dd4218880cb8df36485f029404d4edbb0211ece
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Aug 8 17:17:52 2014 +0100

    Updating gems

commit a5772979e8c448aeb088e0e3d40b81d47eac4210
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 8 16:13:16 2014 +0100

    Specs have deprecated methods removed globally

commit b838a25f7290f4523388a400cb80955814efd42e
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 8 16:11:09 2014 +0100

    Removed deprecated method calls in controllers spec

commit 6f05cc05062dd3d940361459015e938e1672745e
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 8 16:10:14 2014 +0100

    Removed deprecated method calls in models spec

commit 6f21116818dd5055a9cc79e3fcd370c9d0ce9b22
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Aug 8 15:37:04 2014 +0100

    Updating versions

commit 489b2777bbcbb70ea0eb45046439ec82ac2f0f82
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Aug 8 15:24:51 2014 +0100

    Updated to rails 4.1 with some test changes. Still need to add Spring integration.

commit 6a060867494225d0763cd9a905f2be140c0e959a
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 8 15:35:34 2014 +0100

    Fixed bug with resource params calling an auth on nil when creating a new resource

commit e1d701c24275e1b8329f1d9bf9a67c8a981c9527
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 8 15:18:47 2014 +0100

    Further implimentation of file uploads, primarily in frontend and auth

commit abd1ce666eaea6fd28b6303dd8c6a8e200737dd1
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 8 11:09:44 2014 +0100

    Accidently broke uploads table on last commit, now fixed

commit e93fcc03413484e109fbaacc8526a8248afe4432
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 8 11:07:25 2014 +0100

    Fixed accidental error in migrations / schema

commit c9ea2d75dde531d25df22847c332f8734c973768
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 8 10:49:11 2014 +0100

    Added guest comment - naive implementation

commit 018d0259785640441986c5561879196f0645d089
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Aug 7 22:03:06 2014 +0100

    spaced new comment box out abit by adding margin to comment heading

commit 0534ddc9b52565976da1b76a0964a6ac1467fa88
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Aug 7 19:13:06 2014 +0100

    changed link data nomenclature to category nomenclature in module and where its used

commit fdcdbdc5b45f74bfe678062870eb62c90bc31b70
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Aug 7 18:10:45 2014 +0100

    Rudimentary implementation of uploading

commit 12cba21878cfc13a020c26e8a670da2a384ace3c
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Aug 7 15:31:02 2014 +0100

    Added upload authorizer

commit 4e91cee4c360ddf03eaa29c87015b034fab1f8b7
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Aug 7 14:53:57 2014 +0100

    Refactoring linked data and updating specs accordingly

commit 53cc4092fb0d57adb001aaf155018b3c3a734d20
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Aug 7 12:43:03 2014 +0100

    large scale changes to get tags views working with cleanup, presentation changes

commit 05396ec7535def18f225b385238df8e033a2c623
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Aug 7 12:42:01 2014 +0100

    Preparing to add uploads, scattered bug fixes

commit bc95db262332878f13044992594355f2062fbf65
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Aug 6 15:48:18 2014 +0100

    tidied up presentation of buttons on wiki pages content tab

commit 33a36f2ba0f31bc31818020783bd29f07ffc105a
Merge: 5764881 cf13d49
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Aug 6 15:06:48 2014 +0100

    Merge branch 'update-mail' of github.com:markfeedly/social-museum into update-mail

commit 576488199b3c5b6c5ae93dfdfc4f3cb55dbdcff0
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Aug 6 15:05:47 2014 +0100

    Tweaking various things which were highlighted as todo, eliminating some small resource bugs, commiting before large changes are made to resources

commit cf13d495ea85336367293c01eda81fd2fb828a84
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Aug 6 12:57:41 2014 +0100

    tidied up presentation of comments by mvoing thumbs up and down

commit 6a1e62c2f72efa30fd1152e4cf2d0e7e573d2604
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Aug 5 16:49:08 2014 +0100

    Added image uploading, along with a refactoring of resource. Migration needed

commit e5280a94d74df353b10b8e99a951738a2f0459d9
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Aug 5 14:02:15 2014 +0100

    Added user role attr to akismet, added tests for akismet, refactored other tests

commit 002922c77f1cffc1b68715bd321c42a8108e3a79
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 17:54:49 2014 +0100

    fixed styling on page resources

commit 60086ad2310425b873b4726c079feb10288d93a2
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 17:30:19 2014 +0100

    More refactoring of link interpreter

commit 315e3d70154b4f35c49df4a3b75aacc15c396883
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 17:25:06 2014 +0100

    Refactoring in link interpreter

commit 2151e638f57ac832927ca5c4b7380b67c6a8f2ab
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 17:03:33 2014 +0100

    Adding more stringest tests on categories

commit 2df981ab75fcf7c0357439cec5542be2ea1c0086
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 17:00:29 2014 +0100

    Adding more stringest tests on tags

commit f1204b4715100a254def1c688cd096d841a44fd2
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 16:56:42 2014 +0100

    Adding test for stripping out special character tags

commit c688c4a6de0c52ed82fbebf563ed379beda1963a
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 16:50:10 2014 +0100

    changed views to make it clearer what is a tag, and what is a category

commit 9a2597ac3de0cee167f7d0c30145eee5dde286a3
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 16:43:24 2014 +0100

    Added method to clean special characters from tags

commit e96f03aa561bd7494c03764887b74bec0db928eb
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 15:45:05 2014 +0100

    Whitespace...

commit dbdd9f8f1833f525d5c2a0a05c67f65a3239f303
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 15:44:18 2014 +0100

    Changed a comment...

commit d653619ccca4b5fec6b445c9e1d18fd81650c591
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 14:31:59 2014 +0100

    Fixed knock on bug in subscribe/unsubscribe from routes

commit 3318a01bd4bb00e11b902daf1f98b102f6f92dec
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 13:56:04 2014 +0100

    Changed routes for 'pretty' urls

commit 8111f61187c0486cd7eca854f8871fdce1e8636d
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 13:23:36 2014 +0100

    Moved appropriate part of kaminari for resources to controller, renamed param to be more semantically relevant

commit 8a6375d4cc659410da65e76f5bf048f6c452651a
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 13:16:59 2014 +0100

    Small code styling tweak

commit c9f4963a00a1792db24f24727aeeea61aa273b3e
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 12:57:28 2014 +0100

    Kaminari stays on correct page tab when paginating

commit e1d5829bc99c940ecf0cc5a31827776428f79a96
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 12:02:20 2014 +0100

    Moving appropriate parts of Kaminari code into pages controller - first step in preserving current tab upon pagination

commit 2e866e1b136209aa7981c45f6fa08fedbc805fb5
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Aug 4 11:14:14 2014 +0100

    Fixed bug in link interpreter where _[] was calssed as a valid page link

commit 1120c1cca364352f4dfc0bad5d15648a27c0b4cd
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 1 18:03:11 2014 +0100

    tags and categories cannot be links, implemented and tested

commit 81f592a385daff80d615ba2b0ec74f6b0f2609ed
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 1 16:56:04 2014 +0100

    Fixed some broken tests

commit f6be2a57057953769b74f7b7798ad1e97b4f1b20
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 1 15:57:29 2014 +0100

    Featur tests in place for spammers creating and editing pages

commit 0e3394ac7fe06d73ab488f75d7566ba70a319583
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 1 14:56:44 2014 +0100

    Tracking tests fixed

commit d48964d3a9b580231bb95284a47d2e6186fde793
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 1 14:20:00 2014 +0100

    Fixing behaviour pertaining to comments, subscriptions still not working properly

commit d3785b6da1cd0f2d8f25d6f781ca6ffdac7f7967
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Aug 1 12:00:50 2014 +0100

    Rework for data roles on approve / disapprove and delete elements in pages, resources and comments

commit 3b210d4de5291bf1600ba22df21e785f8654047f
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 31 18:17:26 2014 +0100

    Overhaul on authorisation, and user testing

commit bc51644e7b9a2539e5828b90eefd563a3a918c28
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 31 16:37:17 2014 +0100

    Added users button for admins

commit c090bc18ccd8c736153e7e33fa4947d029d48605
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 31 16:33:57 2014 +0100

    Deleted duplicated auth in resources controller

commit 1d5c78aaf1f5fa455f09b1f1b93299e47ce785d9
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 31 16:33:16 2014 +0100

    Noticed a bug in resource editing, added tests surrounding this, fixed bug

commit 98388a782224ddebbbbb746259a0a807501f9821
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 31 16:01:36 2014 +0100

    Added a line break

commit ccc07e50781dc53a9723677d12586f1984004a6e
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 31 15:59:05 2014 +0100

    Changing resources to use icon && fixing test which was needlessly dependent on SQL ordering

commit 9115d32f155e3341f9dc68f3fc9e8d8adb9c709c
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 31 15:54:16 2014 +0100

    Changing page delete field to icon and tidying css

commit 3813600dd1299c3bc7fbd03dee65c4dda978dcc1
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 31 15:41:37 2014 +0100

    Using forked Rakismet for thread safety, videos have max width, comments ordered by aproved first, and recent first

commit e72b82d071c7b893a89b6a96045ed32582985152
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 31 15:13:32 2014 +0100

    Fixing nav steps

commit 8ea2fcee378f555e61351a50e5a0023eb1e73d37
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 31 15:06:04 2014 +0100

    Refactoring out deprecated code

commit eb4c78b39b340db1d692170b404e31366e590d1d
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 31 13:36:05 2014 +0100

    Finishing off view for comments, crept into ammendinding view for nav

commit 0a94075652b97bcafe288f3efb7ff1042e5fd05a
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 31 12:30:56 2014 +0100

    Modifications to slug handling

commit 0cabc9f5e648dfac1f13600bca7a84fd87eb85e2
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 31 11:25:55 2014 +0100

    Refactor cycle over pages / comments

commit f33f7eab605251c4b8f4b7317e02ea8e43ed29cf
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 31 10:46:56 2014 +0100

    Added more cases to when storing paths is ignored in application controller - e.g. all instances of when it is to do with user accounts

commit f9501cf61d51766ec1fe2d3b02ab0b77f60a3484
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 30 18:08:01 2014 +0100

    Spam for comments essentially finished, still some tidying up to be done and cucumber

commit c00863d8b0596ed916f2daf86935e71cc78841d3
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 30 14:53:40 2014 +0100

    Tests in place ready to drive out (dis)approving / removing of comments

commit 6720f0ca145fc97c371bd2bba25c5f540eb8aafb
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 30 14:21:43 2014 +0100

    Users can always see their own comments, even if unapproved. If it is unapproved there is a message saying so. Other users can only see approved messages, except for admins which can see all.

commit 8aa4df6f3711958d2b944353818d3833c7d0c0ad
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 29 17:39:30 2014 +0100

    Changes to page comment tests
      Page comment tests divided up into three files pertaining to different aspects of behaviour.
      Existing features refactored to remove incidental details.
      New features added to drive out implementation of administrative features pertaining to 'spam'.
      Domain language being established of comments having status as either successful, or pending depending on their status as approved or unapproved respectively".
      Step defs as of yet undefined for new and refactored forms of features.""

commit ed697c544d86ecc3ba9c84ed8dc62b011284250c
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 29 16:25:09 2014 +0100

    Rakismet filtering implemented (in test mode) in controller and model, views as of yet do not accomodate for this, and comments cannot yet be marked as false positives / negatives

commit a106646846dade1b88e18aa4b69bfc788f65c50b
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 29 13:42:17 2014 +0100

    Cleaning in preperation for using Rakismet over Akismetor

commit 50fe17e271d2d1d9c2f17277d16cf813d0b88457
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 29 13:13:44 2014 +0100

    Reverting comment files to state they were in prior to adding code for spam filtering. These changes can now be seen in a new branch. It may make sense to merge this branch (update-mail) into master

commit 96b76268fab1b10dbecd23f861b2cf0b6acf20b2
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 29 12:44:08 2014 +0100

    **Partially** implemented spam filtering with Akismetor
      Code for Akismet(or) has been added in:
        - comment model
        - comment controller
        - routes [for marking as spam/not spam manually]
        - views to reflect changes, although this naturally does
          not affect the logic
      The system is currently in a pseudo working state - in the it will
      not crash out in normal operation - although submitting comments
      will have no effect, and comments which exist are no longer
      displayed.
    
      I believe that the current lack of functionality lies in either
      the new routing added for comments, the akismet service itself, or
      perhaps naivety in my modification of the controller.
    
      As a result of the above, cucumber and rspec tests for the
      comments are currently failing.

commit 339a0f25a1e1733db8975d3ec39a5897152cd764
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Jul 28 19:16:38 2014 +0100

    refactored to use favicon_link_tag, put default favicon in app/assets the default location

commit f58a122f123ba9709b294a4740c2a7d34860fdc4
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:51:07 2014 +0100

    Refactoring featurse for clarity

commit 42649281c04f1be7f1fa382666c53245218cc066
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:47:19 2014 +0100

    Small feature refactor for pages

commit 46a8c19fa45a59ac721c63e0371bab858a03ff68
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:42:20 2014 +0100

    Simple tidying

commit 5201a7a4fc16647282484e245da4b99ed8271fed
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:39:48 2014 +0100

    Simple tidying

commit 9ffcf8c413d0ab01fef1a42849629d5c15a58e3a
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:35:43 2014 +0100

    Adding todos and tidying

commit 43f89faad779cb32855a6f67336521b7dda05397
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:31:39 2014 +0100

    Whitespace...

commit 80121a95274a8cefad59c4fb1ddefabfd07b97af
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:27:42 2014 +0100

    Whitespace...

commit 9aad244865d7c221880d971113aa5c0b54820eaf
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:27:23 2014 +0100

    Minor change to page decorator

commit cd7f9fa4b5f94ae9cd8ccbe2d178af78fa2a5b8b
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:25:43 2014 +0100

    refactoring, todos and tidying on multiple files

commit 02addb7b8feb30d3e6b78f5367d29edcf4255995
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:16:17 2014 +0100

    Whitespace...

commit c71c2ad74d73cb5253389578e867653f7fd9baf9
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:13:37 2014 +0100

    Whitespace...

commit e7186e798e6cb4c71bac6cf0473f1eca0bde031a
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:13:29 2014 +0100

    Whitespace...

commit 74880f7749d63a12a860a51c8c0258a878fd2863
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:13:08 2014 +0100

    Whitespace...

commit 8014a3f0ae7d0eae097abf5ea1e4f79a23994685
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:11:40 2014 +0100

    Whitespace...

commit 00de7d371cbb23fc652b5c76fcbf296704a36eee
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:11:03 2014 +0100

    Whitespace...

commit e852007a5a0a1c6c5c7ac7be7f31adff7c45b720
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:10:17 2014 +0100

    Restructuring parsers tests for clarity and context

commit 03ccab2e71dc5a8c4b468424d07822d8a05d9256
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 17:02:29 2014 +0100

    Adding context to tests for link interpreter boolean methods

commit c324b23a9a5b979dd33a593c43d57890497f9a91
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 16:51:58 2014 +0100

    Extended resource spec and changed validation in resource model to be more stringest

commit 52a21f2c5b5effa17cae65e9fa942d5e5ad9ff5a
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 15:47:30 2014 +0100

    Improved resource spec

commit 43815d0975838def745e63286503c277af332405
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 15:40:33 2014 +0100

    Minor refactor of page_state_spec

commit 98ce8b65b4edb9f70999ce7af93d0eba2b976343
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 15:36:03 2014 +0100

    Tiny syntax change to slug spec

commit 8befa4691bb3314c341f35e95f13247017050841
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 15:34:52 2014 +0100

    Stylistic changes accross spec/models for readability

commit 64cedc536e245491f90b6c7906b5217afc9d0c94
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 15:28:31 2014 +0100

    Whitespace...

commit 08785c0b7833cadf8ae151163f07c4072b13eb2d
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 15:22:45 2014 +0100

    Refactoring and extension of page specs

commit 2e15f6311a9637c16637a76fa5cd35ace7454c7f
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 13:12:31 2014 +0100

    Adding validation checks to page_spec, and adding more context for test cases

commit a0e3a2c47fdae71ce559966dc017ccad970166f0
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 11:44:26 2014 +0100

    Modified content_html_genrator_spec to have more appropriate tests

commit c38e7cabd0b43836dc2aabb85133a37547fad9c3
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 11:34:27 2014 +0100

    Altered tests to be compatible with standard markdown format of Redcarpet

commit 0de2a40050f7c4ffbe856c95e12853466d9a0142
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 11:29:48 2014 +0100

    Further development of link interpreter tests for vimeo

commit 7bfe52d3466b0eaffb02fc6d41eb18f8ee0661c5
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 24 11:09:41 2014 +0100

    Further development of link interpreter for youtube && accompanying tests

commit c685120e1274dda737f5bfeffacb7da44bfee633
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 23 15:47:25 2014 +0100

    Further improvements to link interpreter

commit 4d53eff74e71e5313006facd358d47dd0f5fe8b6
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 23 15:27:30 2014 +0100

    Fixing and adding tests for link interpretation

commit e2cc1b1b3258ce863b47de6b94054106d5c2f8fe
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 23 15:04:37 2014 +0100

    Adding width setting & processing to video links and refactoring of video parser methods

commit 3632e614e55aed428ebc3613cc797d8e4bbad0bb
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 23 12:25:23 2014 +0100

    Whitespace...

commit 67bafe1f55b8b236870be47647a918abac76bceb
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 23 12:18:49 2014 +0100

    Added tests for video parsing

commit 00a670b3613ab7dd017eb80c80b328eb9c07baaa
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 23 11:56:01 2014 +0100

    Adding more test case to link interpreter, and restructuring

commit 70392ad362fcfaf7a83238382897a9de951459fb
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 23 11:27:35 2014 +0100

    Added greater number of test cases to a link interpreter test & restructured

commit fdb22d7da298c961ecd0813f28d5b27b9baf5f00
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 22 17:55:26 2014 +0100

    Proper expectations are in content_html_generator_spec, however processing is not happening properly

commit 76b07aa0f52ecbef59928a0041392bd69a5b5a08
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 22 16:31:00 2014 +0100

    Removing traces of moscow

commit fc9f37aeb4dbf46e6735ef2c22010dd60aab92f3
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 22 16:05:32 2014 +0100

    Fixed bugs in comments

commit 96c74745eed09befb711c81e9cf9b4ebf65120b6
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 22 15:38:13 2014 +0100

    Fixed annoying bug with location of remove page

commit 21742504501525c39b7dc3474962273f5b80b096
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 22 14:56:44 2014 +0100

    Minor fix to comment styling

commit 910435ce0396ee167a9291f926d88a30b0de00d1
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 22 14:45:50 2014 +0100

    Restructing category views

commit af801290861c32c442d56a8488267746a0a5111b
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 22 14:29:34 2014 +0100

    Restructuring views / layouts

commit 31274ef8c8e324c3224c9024a09f1443da902f0b
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 22 13:50:20 2014 +0100

    Cleaning up markup for Pages

commit 63a2f69e52c4d5c15497014a5e1bf94cd3bc5ebd
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 22 13:35:05 2014 +0100

    Minor refactoring in _page_content.haml

commit aff9a2ff451e7ffa0bafbd6268e4cca373600d4f
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 22 12:19:00 2014 +0100

    Fixed pending test in categories

commit 90325bdd5764b112126a2b2458c57e0eff535d90
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 22 12:09:02 2014 +0100

    Changed some quotes

commit 3dfd5772428cd9efc53db1bb8a5d20d098f224ee
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 22 12:01:02 2014 +0100

    Fixed broken subscription_specs and slight refactor for clarity

commit 1bed5f2f2cdede497ac3c85bb236a88a9040452c
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 22 11:43:58 2014 +0100

    Restructuring sign out back to link - more homogenous with rest of navigation

commit 86379afdde2da6fbeb16445ea2f15db180a5e891
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 22 11:32:48 2014 +0100

    Removal of superfluous controller tests, added todo on oauth controller_callback spec, improved cleaning strategy for FactoryGirl - was causing dependency conflicts in resource_spec.

commit 42973d813d5807b1d6e08dd07d54f4db8ba73625
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Jul 21 18:00:45 2014 +0100

    Major reworking of resources

commit 552c12c5ff9b4d9aa267d6ac382508618a06a3c3
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Jul 21 15:46:28 2014 +0100

    Changed language to be more 'ubiquitous' / understandable

commit ee283fc6570eecbcc36ac9db99a7f285c60e4a68
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Jul 21 15:41:34 2014 +0100

    Structural refactoring in add and change page, corresponding removal of redundant fixture in view_page_steps

commit ad049cf734da9423e701e2f17cfbecde2a3994dd
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Jul 21 15:29:32 2014 +0100

    Major restructuring of existing features and fixtures, along with tests added for pages and navigation views

commit 514d1220acc3498339de5028b06bd4bf98389c56
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Mon Jul 21 10:49:52 2014 +0100

    Refactoring of features started (and corresponding fixtures), first deduplication of item indices of view_pages completed

commit 508156e29d76534b80d431e654f8967c828249fe
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Jul 18 16:58:31 2014 +0100

    Made comment history tests slightly more extensive

commit 7fb9daf5a48dd820bba7c76fcdc009e324330ca5
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Jul 18 16:55:00 2014 +0100

    Added content chronology test

commit dd852d6f89f173aa79241b2374f2cc96a140bb32
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Jul 18 16:46:49 2014 +0100

    Added test and steps for testing page comments

commit b84e6bc8e5b89b8fdb150058c592d780ed749888
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Jul 18 16:21:23 2014 +0100

    Rewriting comment views to give data entry for index and have more homogeneous syntax

commit 9eedad4c83933c51c4d751b2575cb65bcb94a8c2
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Jul 18 16:06:58 2014 +0100

    Converted comments form into haml from erb

commit 0a0a2aca31c41e027f6e82c2b37c2dbe673f0a5a
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Jul 18 16:03:51 2014 +0100

    Replacement of another hard link with route

commit e58a462ada5e3c7a4cd1b9d36393a2dda3814d82
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Jul 18 16:00:28 2014 +0100

    Replacement of another hard link with route

commit 6a4c97bb9586ed3181271ccc86e760b4f78f7880
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Jul 18 15:51:22 2014 +0100

    Added message for if no resources are associated with a page, and re-added 'Add resource' button using route rather than explicit path. Associated TODO added, as button currently will only add novel resources, not allow the choice of pre-existing ones

commit aed8b60858f7764a63a4e995234a678cc281ddfd
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Jul 18 15:41:05 2014 +0100

    Implemented embedded Vimeo videos into Pages

commit 834b20bef6b62d8de3628eed1f6e7f8524229fa5
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Jul 18 15:23:37 2014 +0100

    Added a css class to refer to content in resource views akin to the one present in pages

commit feed89e85070f54fb543c63fc6d942bc039a2584
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Jul 18 15:02:33 2014 +0100

    Partially prepared to test OAuth, modified Resources View, improving of features and steps

commit f46e15f70c5e5d70be75c6b5f86d0f2ef7358564
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Jul 18 10:53:13 2014 +0100

    Replaced more explicit paths with routes

commit dfd49625a6a767cde3daa8b996a7a9630010c157
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Fri Jul 18 10:15:00 2014 +0100

    Moved steps back into single folder structure until it can be figured out how to make RubyMine play nicer with nested structure

commit 0ce61a6005b0c1ea0fd9bf81918006dc74a65236
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 17 16:53:43 2014 +0100

    Cleaning up new tests

commit 8556d27fff7db9f9d697d4a7cda1de724cfe63d1
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 17 16:43:59 2014 +0100

    Adding resource content tests

commit fa71016e7e990d0f59e9836fac745054d7a1f3e6
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 17 16:24:17 2014 +0100

    Made content steps more stringent, realised they are generic between pages and resources and renamed / moved accordingly

commit 83f3058a389edcfe9157e0958ec6a251ca2bb487
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 17 16:18:29 2014 +0100

    Another resource test

commit b7b969771bd4b9e9673884b575b8f4f2b4d96a51
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 17 16:15:03 2014 +0100

    Added resource test and made existing tests more stringent

commit dbbd15f6f1d26c03a4910952185bfef3ab304c3c
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 17 15:42:30 2014 +0100

    Added resource test and moved step defs into own dirs for clarity

commit 5ec2d903046a3425f04c8ae8df591feab06d48b9
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 17 15:21:48 2014 +0100

    Added resource test

commit c90b04e3c0454e45b9bebeeb985a6772fb248f9f
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 17 15:13:40 2014 +0100

    Adding resource tests

commit 0043676d1797530f41a01c4c97ec6c0c3adfd6bb
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 17 14:39:57 2014 +0100

    Migration to simple forms and associated refactoring

commit 4686fbe19464be5da6f9d1d63a967b6a4eba2709
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 17 12:42:20 2014 +0100

    Made error test for Title more general, to work for any type of error in either page or resource and moved to it's own step def file

commit fa7f6088dbe144daa4dbb286d3361402ab6c8b56
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Thu Jul 17 12:29:30 2014 +0100

    Test Refactoring
    
    Introduced a data-role hierarchy for forms to allow more precise
    testing of error messages without tying the tests to specific HTML
    syntax structures. Started moving tests to this, starting with the
    title attribute on the page form.

commit 8265d583968cb129feadcc9c0cc4c1e16559b135
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Jul 16 22:31:33 2014 +0100

    added a pending test to page state spec so we return to check out what validations should be made in PageState

commit 9a1a4fca8b1abd8feda3899fc74bebab28fdc67b
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Jul 16 22:23:05 2014 +0100

    fixed dodgy link interpreter image_url? and made some changes to link interpreter boolean methods spec

commit 8c85ef800570226274f6dbfa053c86c18df2c951
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Jul 16 20:38:53 2014 +0100

    nother test passes in link interpreter output spec but style issue remains

commit eb7334210e462bcac5f26c1de3faae93682add20
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Jul 16 20:33:39 2014 +0100

    refactored link interpreter output spec

commit 086237bf5f1d527681ef8a5c4bc7f395e91ac73d
Merge: 243f927 a871b0b
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Jul 16 14:50:42 2014 +0100

    changed link output spec added helper method and refactored

commit 243f9276a072b5852cffdb0d69e3b166c59e08c8
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Jul 16 14:50:12 2014 +0100

    refactored link output spec to include a helper method

commit a871b0b1169339ba793b499c9a50210f5c60eace
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 16 14:47:08 2014 +0100

    Added more resource tests

commit fbcdcd66f37aa194083086f090c4c5eec7581329
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 16 12:28:55 2014 +0100

    Added new test to remove page feature

commit 3b444ae164aa8be3d6f717a60ef0c53b135bc4ff
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 16 12:23:36 2014 +0100

    Clarified feature title for removal and contents of pages

commit 96ae20ab1374a1017bebe55796b6789d33852e47
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 16 12:22:05 2014 +0100

    More stylistic 'refactoring'

commit faafed599c0362864efdbb0e736ca5993899aedc
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 16 12:15:18 2014 +0100

    Fixed type

commit 914abee177b5729f5c0e31417aeab011ba5b5e0f
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 16 12:13:50 2014 +0100

    Cosmetic / stylistic 'refactoring' of step defs

commit 52adc88cc134679a6165d78d15a07a57a8f73007
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 16 11:57:29 2014 +0100

    Adding tests to, and refactoring pages - both in view & in features/steps

commit 1dd2e4d0b1abe0fca40325436ac730f71f5e196e
Merge: c70c3ed 80faf50
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 16 10:37:58 2014 +0100

    Merge remote-tracking branch 'origin/update-mail' into update-mail

commit c70c3ed45e9e8b8c07ae974af61e4d08ed5f70e0
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Wed Jul 16 10:37:15 2014 +0100

    Refactoring done to user features

commit 80faf50cf1398c23a4f38950f3e8725563fee316
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Jul 15 23:59:04 2014 +0100

    broken tests in content html generator spec, see page spec for fix

commit 43c4fa0f57a90ee6428a31cccc16aee6202eb485
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Jul 15 23:54:58 2014 +0100

    refactored link interpreter spec a bit - needed to add to page factory

commit 8e019d3fa5e4aabe1396d1be2b430bd8539e8727
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Jul 15 23:16:45 2014 +0100

    remove find by moscow prioritisation from page.rb

commit 07c972ef4976df2769fc4f798a92c58889d4659e
Merge: 7670d75 9f32f8c
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Jul 15 23:07:56 2014 +0100

    Merge remote-tracking branch 'origin/update-mail' into update-mail

commit 7670d75fe17c4b6a73191d37819e4b908691824a
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Jul 15 23:07:22 2014 +0100

    get page spec working again

commit 9f32f8c19653f2f8743147d73bbd6ecb02d8cf64
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 15 18:47:01 2014 +0100

    Added test for addition of multiple pages and their apparition in main 'Pages' page

commit 442df7974b986d04d6ac8d7921090da37ef2e568
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 15 18:23:22 2014 +0100

    Changes to users steps and signin, signout and signup

commit c717c0658efa6b70a62d4785a381f451483decd4
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 15 17:35:45 2014 +0100

    Fixes to tracking test & general cleanup

commit 962cf6ff39bf36c2db33ca6b7a5cc8e636292039
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 15 16:42:41 2014 +0100

    Refactoring in sign_up and delete_user

commit bd8dbbe55bca8f69ed7fa175dd91c0f283aec45d
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 15 16:21:03 2014 +0100

    Removing moscow remnants

commit 350003962f93713e4123bde3cf4a0ae6c3be1a94
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 15 16:08:34 2014 +0100

    Made site 'Branding agnostic'

commit 94a41dddb2ae62df716dd750a1e45fac2c07615a
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 15 15:57:51 2014 +0100

    Bringing pages View in line with standards set for resources - Tone of default messages is questionable

commit 6bbd437996dce4c9c65aa32084d5d109174898ba
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 15 15:43:13 2014 +0100

    Migrated DB to remove unnecessary moscow table in pages

commit afcd78e846981bb662e2624907a0f7d464e0f9ce
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 15 13:38:43 2014 +0100

    Refactoring routes

commit d0c697e472177481e88c4fe05c8b9bb556aea977
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 15 13:23:29 2014 +0100

    Removed redundant step from 'Given I am signed in'

commit 89dc5f14ca16268b184371a8ad81637fb9cac19d
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 15 13:18:42 2014 +0100

    Removed redundant code and changed styling slightly

commit bc639040ac03ed59d34515246e23d0ad368624a7
Author: Charles Reynolds <reynoldscem@gmail.com>
Date:   Tue Jul 15 11:18:00 2014 +0100

    Added vimeo test - Cannot yet pass as funtionality does not exist. N.B. Vimeo URLs are bizarrely formed, directories are dependant on content and slug seems to be relevant part to parse

commit 56b5aabd55e2e61b154d168bf904fcc37b934486
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Jul 14 19:21:49 2014 +0100

    improved link interpreter spec a bit

commit a98660c9e6eea1d5542f8d2441fb8ed54e54d1f0
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Jul 14 18:14:20 2014 +0100

    diverse features now pass

commit 94fbd8eb2c9b475982f2f65b16ecc615056aebb7
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Jul 14 16:21:13 2014 +0100

    Updated change_title_uniquely_steps.rb

commit ef669294626f861f7a00062cf31ee6c37193a55b
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Jul 14 15:33:41 2014 +0100

    Removing \'Implementation details\' from tests in add_page_steps.rb \& edited syntax

commit 6f27b39dd2b027c6b804e9181c40a277e5028bb1
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Jul 14 15:15:50 2014 +0100

    Deleted extraneous test from add page feature

commit d64d0376f6233fc1044dbe0cd8c850daa603dba6
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Jul 14 15:13:17 2014 +0100

    Fixed history feature tests

commit ed85685e12d10121c5404dfc8aa13079e6814235
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Jul 8 20:02:38 2014 +0100

    getting to solve email unsubscribes redirects to email unsubscribe page

commit b1dabfa6fb52fc10f61a69512b40fd15745d7be8
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Jul 3 09:03:08 2014 +0100

    with authentication problem on subscribing via email

commit db9e8cdfc599e5df38b5826f8c99c9a8815c1fb0
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Jun 30 10:44:09 2014 +0100

    toggles page subscription on and off

commit 98daab7c0ae890ed0ac96cf29057938fbc2467ae
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Jun 30 06:22:15 2014 +0100

    before adding page unsubscribe for users

commit 449acc9188197aaa84e626bbda43d386b23d14bf
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Jun 29 20:44:39 2014 +0100

    all three scenarios in tracking feature pass

commit 3e43637e842b8e7b98083002cc6c53509ccefd40
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Jun 29 15:14:56 2014 +0100

    changed users to subscribers in Page, got subscribe spec working

commit 7e9b32a981f024801490434ae18adfa17595982a
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Jun 29 14:22:50 2014 +0100

    many-to-may problem solved with user.reload

commit db7bcc8814cece12ab2c30da9f3162402ec6b4c8
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Jun 28 17:10:34 2014 +0100

    wiered many-to-many problem with subscriptions

commit c5bc24638a8e78cafc17f83c2ea1ee550226689a
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Jun 27 18:18:38 2014 +0100

    link_to working in email tamplate

commit 92f5baa1f7dd122c3ed048909fa1e5b3dfd9418c
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Jun 26 23:15:33 2014 +0100

    Page creator is notified when a comment is created passes

commit 24b3e9376306e1a6ce0cd9a8abdff3f6eee3dbea
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Jun 26 08:25:24 2014 +0100

    basic page subscription mechanism fleshed out with methods for subscribing and unsubscribing

commit 66efb87a15a5a60d1420875785a7e68e0fe9b16d
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Jun 26 00:16:24 2014 +0100

    rm comment_spec.rb

commit 0d08aa34212638f6f3317aea53cf8c9e3fc1f937
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Jun 26 00:14:21 2014 +0100

    spec for users being subscribed to a page when creating page or comment

commit 7bac23168c937c8cec0cae9b36e3bc5950206896
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Jun 25 17:04:32 2014 +0100

    tracking feature mail on comment creation part done prior to CommentObserver

commit 638d4c14a9c7dcea7bd7fffa0bb2f469c3a56a05
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Jun 25 16:50:32 2014 +0100

    tracking feature mail on comment creation part done

commit 890edf3b8ac76e56a8dacc2f11161c1a90bdc66a
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Jun 25 13:16:53 2014 +0100

    before refactoring user_steps.rb

commit bfbd65fdc8e5c09c2526ec645b28f9299c6859c3
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Jun 23 07:20:17 2014 +0100

    start to comment tracking features

commit a60a88eec9778f7d7a3ad030a8cdf4dc079e9f88
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Jun 22 10:30:04 2014 +0100

    still some work to be done in features/pages

commit 3c9cffab918995e1b59aab299a8529022408d1ee
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Jun 22 10:25:26 2014 +0100

    fixed funny in user_steps.rb see TODO cause its currently unexpainable

commit b31180eeb39941ae644b634051ae7a18b08d1ca1
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Jun 21 23:01:52 2014 +0100

    user edit and show features changed logged in to signed in

commit c0acf6b900bca588e40d715aa886c4519f02bc01
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Jun 21 23:00:36 2014 +0100

    sign up feature passes with confirmation emails

commit e229fcb592a851a42314a8d4c09b22c14f570515
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Jun 21 22:51:28 2014 +0100

    sign in feature passes with confirmation emails

commit 4a9089861d76240eb604ec5324e0ac2e3ff360f7
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Jun 21 13:45:51 2014 +0100

    sign up with email confirmation feature

commit e8a5133b12a2b302db81483edc07e8139efa5410
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Jun 20 21:45:31 2014 +0100

    before merge back into master

commit 78fbdf895070b59cdc5de23667cdc12143e3432a
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Jun 20 19:22:13 2014 +0100

    partially working fix of dave for staying on history tab

commit 94000801129410c95dbf03dd3dda0596180accac
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Jun 20 18:38:39 2014 +0100

    kaminari paging for page history now works

commit 0128fb2cae56d757bd2fd49511c75650b1fc8e96
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Jun 20 18:34:27 2014 +0100

    started writing some resource specs

commit 7bf7d8434b783d4e7a385711c128ff62f45a214e
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Jun 20 16:39:40 2014 +0100

    duh it works mistake before

commit b43307f08c8d86a54ab6663387f54acb8fe6cc57
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Jun 20 16:09:18 2014 +0100

    db error w secretary rails

commit 62c90f2d4a95eb7f8e45229ba99c7fe45a7deebd
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Jun 19 20:00:09 2014 +0100

    kaminari in tabs still a mystery

commit 9a5d531586a902767f9d49cdcf8207617d55550e
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Jun 18 15:35:52 2014 +0100

    continue tidyup of views with only info for vir mus

commit d43893867b5e31ff0b88e4a8633182dee2be0e02
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Jun 10 21:59:22 2014 +0100

    added cucuber scenario for mav menus and restored umcs nav menus

commit 18fcfda693d11f1b6089031d18e5cec81d317e91
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Jun 8 22:06:19 2014 +0100

    created two tests in page slug spec

commit bd0a963257df2ec31cccc8497dd9588a88f9dd99
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Jun 8 21:58:20 2014 +0100

    refactored unique page spec

commit 837fef17e542041f87342dbe9569e9066abbbe32
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Jun 8 15:53:42 2014 +0100

    make specs w no content throw

commit a97b924993349a2a8446acc85e1bdcfbb80bb120
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Jun 8 15:51:06 2014 +0100

    did some work on page state spec still needs more work

commit 20e6d72ec3adbe75dfcdf104d83a695dba92ecdf
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Jun 8 15:42:23 2014 +0100

    added unique page title rspec

commit bd5c864fd8934014c494fcc6de502731a60031b2
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Jun 6 15:32:59 2014 +0100

    removed page creators and editors spec - as a result of refactoring page spec

commit 0f5aaa10f0a31a4ba56ccca3914a5c4ea53ac093
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Jun 6 15:17:36 2014 +0100

    daves fixes to HistoryControl and refactored page_spec.rb

commit 03b448d90dff58da242ba538dc0e53e50a8eb3d4
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Jun 6 00:27:40 2014 +0100

    mostly rewrite of ./spec/models/page_spec.rb still 3 fails

commit e4cec9e91a5a3b9dad5be0c46aa5c5cdd692ef61
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Jun 5 20:06:31 2014 +0100

    removed page_state_id from pages

commit 7f3d120412be98e1a4227568e6ed1c4fb0496efe
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 28 23:47:24 2014 +0100

    fixed format help button

commit c7de13079cce4141025f010c1e4ae4ef6e40d682
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 28 21:35:19 2014 +0100

    added event param to js function to prevent default on click

commit 3fd6a67fc672a225a3b6a2a823978352b20b73d6
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 28 21:26:01 2014 +0100

    ie9 trail fix for editing help

commit 97c6c6497dd76ed4a6381707978e3d2941b5483f
Merge: 7adfc1e 3a5cb43
Author: markvan <markvanharmelen@gmail.com>
Date:   Wed May 28 17:10:39 2014 +0100

    Merge pull request #8 from workmad3/master
    
    Use a 'live' click handler to deal with turbolinks

commit 3a5cb4328fe78bb87bd7c41281823bbbb9deed5e
Author: David Workman <workmad3@gmail.com>
Date:   Wed May 28 17:10:03 2014 +0100

    Use a 'live' click handler to deal with turbolinks

commit 7adfc1e8f5ddab7378d00e177a5e41003ab0806d
Merge: 19323a3 16d3f0b
Author: markvan <markvanharmelen@gmail.com>
Date:   Wed May 28 17:08:54 2014 +0100

    Merge pull request #7 from workmad3/master
    
    Fixing some JS ordering

commit 16d3f0b1d8484ae38d7a7782efce622c4fff9299
Author: David Workman <workmad3@gmail.com>
Date:   Wed May 28 17:07:57 2014 +0100

    Fixing some JS ordering

commit 19323a388a4063d827833832e745f7570a7db1f2
Merge: 03e8583 9160fb8
Author: markvan <markvanharmelen@gmail.com>
Date:   Wed May 28 16:51:56 2014 +0100

    Merge pull request #6 from workmad3/master
    
    Using min-height rather than height on hiddenx

commit 9160fb822683231604ebafe3e8699b60ff8a3df4
Author: David Workman <workmad3@gmail.com>
Date:   Wed May 28 16:51:07 2014 +0100

    Using min-height rather than height on hiddenx

commit 03e85835223ce55e24b056b98d56c4bbaf58cf88
Merge: 4dd339f f11a958
Author: markvan <markvanharmelen@gmail.com>
Date:   Wed May 28 16:45:13 2014 +0100

    Merge pull request #5 from workmad3/master
    
    Fixing JS

commit f11a958cfcdb11e9dcc5f733a117abf2415c071b
Author: David Workman <workmad3@gmail.com>
Date:   Wed May 28 16:43:19 2014 +0100

    Changing CSS ids too

commit e0d72ffd9bd30737455ac888855549d01fe67ab7
Author: David Workman <workmad3@gmail.com>
Date:   Wed May 28 16:41:22 2014 +0100

    Fixing JS

commit 4dd339ff9e35b0231ce4bf89d3b97266f42a49ee
Merge: 9475157 e7aadf7
Author: markvan <markvanharmelen@gmail.com>
Date:   Wed May 28 16:25:39 2014 +0100

    Merge pull request #4 from workmad3/master
    
    Fixing sass-rails issue

commit e7aadf733393981b39b3670ee7bee691004da38e
Author: David Workman <workmad3@gmail.com>
Date:   Wed May 28 16:16:32 2014 +0100

    Updating sass-rails to version that doesn't cause error. Also added image compressor and webp

commit 14c609b8c2cfcdf6908b453dbc18602cc1341544
Author: David Workman <workmad3@gmail.com>
Date:   Wed May 28 16:09:17 2014 +0100

    Not commiting mark's try files to the repo

commit 5c1f129be4d2c9f8cea058e925dacdf892aaa99a
Author: David Workman <workmad3@gmail.com>
Date:   Wed May 28 16:07:06 2014 +0100

    A bit of cleanup

commit 9475157a93867dea761acd2b91f7dd2ad171af3c
Merge: 076da96 38bc08e
Author: markvan <markvanharmelen@gmail.com>
Date:   Wed May 28 15:56:02 2014 +0100

    Merge pull request #3 from workmad3/patch-2
    
    Update _comments_page_tab.haml

commit 076da960b903a6dd49115dc7ea54a0e336b67185
Merge: 92af832 23b8c31
Author: markvan <markvanharmelen@gmail.com>
Date:   Wed May 28 15:55:42 2014 +0100

    Merge pull request #2 from workmad3/patch-1
    
    Update page.js

commit 23b8c31f72c16c62106bad8ebf9956ea693c497b
Author: David Workman <me@workmad3.com>
Date:   Wed May 28 15:53:34 2014 +0100

    Update page.js

commit 38bc08e2c74823976058c1867c53181b250b699b
Author: David Workman <me@workmad3.com>
Date:   Wed May 28 15:52:38 2014 +0100

    Update _comments_page_tab.haml

commit ac886dc5da9450dd316907dcfd381c5619ee6212
Author: David Workman <me@workmad3.com>
Date:   Wed May 28 15:51:49 2014 +0100

    Update page.js

commit 92af8321fb22c6219851912faeb639f36d7b9c12
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun May 18 18:04:35 2014 +0100

    hack to set user 1 to admin in production system

commit 7c29dc655a0315e6bf916268b141b3ef190087af
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat May 17 21:11:32 2014 +0100

    updated rails to 4.0.5

commit cd23e0788e80728088fb30a8d22269d3f45af173
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat May 17 12:18:18 2014 +0100

    tidied up css for lists to add bullets back to pages other than index pages

commit 00b7b384f7288c7727b475dba20a35543a086988
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri May 16 20:00:57 2014 +0100

    better NR monitoring

commit e011fe7a3fcaab39e1374930b63f153474ee065e
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri May 16 18:55:44 2014 +0100

    push gemfile lock

commit 570a5405beb211bbb56080bfefb6f75ba42371e6
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu May 15 20:44:50 2014 +0100

    added gem newrelic_rpm

commit da74d0e9701a16255035e7f38234a71966e373b1
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue May 13 12:49:55 2014 +0100

    try deploy again

commit 79b522a6428349392fb9f4007c9f768843bbee67
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue May 13 10:43:40 2014 +0100

    tidy up dir structure ie removal

commit 3734c230efeb1b171c10ddf9758032c3bfa37703
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue May 13 10:42:06 2014 +0100

    title change

commit ea7058967e2a905b4b6524859a54735e37cf6772
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon May 12 11:17:33 2014 +0100

    removed resources tab and made user confirmable again for production site

commit 8247d9a13314b73b6a8d04d4c1b75952376a2ada
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri May 9 16:35:14 2014 +0100

    added moscow to pages

commit d0caa943bf2bcf7fa2c1f1b3517023f7a54c28e3
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 7 18:08:33 2014 +0100

    using the right favicon and sorting out twitter user sign in

commit 09143e0f992c880d4e20a73e31a15f53d149d41b
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 7 17:28:59 2014 +0100

    fixing bracket issue

commit d936b714b21e0ebf3f818635fc80565d6dc36e89
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 7 17:17:43 2014 +0100

    cleaning up some data- attributes

commit 89cf13eeafa5903575af3e78aa6957958ec3fffa
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 7 17:16:27 2014 +0100

    fixing that indent error properly

commit 4f1552eeb33f1ee6e3dabea44c24d924d129d605
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 7 17:16:07 2014 +0100

    fixing an indent error

commit a0770e1269bda9e19386634fe3db4e388397672b
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 7 17:15:39 2014 +0100

    fixing links to images and sign-up pages

commit ee33c6cdfc438f12333b790f95a23eaa06136f92
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 7 16:57:46 2014 +0100

    bundling puma and updating lockfile

commit 693dcb3292d9225decf81059269b3fa111d5a240
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 7 16:55:43 2014 +0100

    added puma app server

commit a968972a78013b8dcc3d5ef93b6a6421ce34843b
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 7 13:22:26 2014 +0100

    added confirmable to devise

commit 7aee4a646945f952c4425392761b444385fa67ce
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 7 13:05:17 2014 +0100

    removed resource edit items in prep for deploy

commit b75a59de543476ad666617c46672075e20c9b3d0
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 7 10:31:34 2014 +0100

    Makeing ready for deployment

commit d1e7b9c3b8a17289b7727cae3f092bd0e828cbd2
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed May 7 10:19:16 2014 +0100

    dave fixes destroy error leading to stale object

commit 3e69e1dfc9a58a6a4e9f50535648f2d6f2f6065b
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun May 4 22:50:36 2014 +0100

    refactored some of the page conflict view by making a small commit partial

commit 965641645badd6cb5761b22ea8569916d5807968
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun May 4 18:53:40 2014 +0100

    cleared up instructions on resource form to reflect no use yet of local files for upload

commit 4aea2fde9dc71ca056dedf1a36895a79f1f84857
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun May 4 18:31:58 2014 +0100

    cleaned up kaminari etc

commit c599171e3ff04ae4e4ebe8fd49ff7ac6824bb4e6
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun May 4 16:40:04 2014 +0100

    tidied up routes.rb a bit

commit 35eb6dcf50f8c82b7d5452386eef2b2f4f7932f4
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun May 4 16:31:03 2014 +0100

    added page type links controller and view

commit 0128516544ed34947dca523ed2664a7edbd02a74
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun May 4 14:46:07 2014 +0100

    some layout and colors in page summaries page index and pages

commit 4fdc4481976494a5f5c469fb9ae0c60e9d658ffd
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun May 4 13:46:42 2014 +0100

    bootstrap Kaminari page choices look okish

commit 3eb2ea1e522441041aa438926d849f4a3c276a37
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun May 4 13:42:46 2014 +0100

    kaminari on pages before styling page chooser

commit 745e68a6ad4a747c140073ae8b4c91a4f189986d
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun May 4 13:16:20 2014 +0100

    WAYHEY resolve simultaneous edits of pages form done

commit 4b90dc6c3c31d93a16f705b9f33643b5ab726694
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun May 4 12:09:11 2014 +0100

    tweak conflicting editsw page

commit 4832a72cf60f53ac2b99c57b5e0c27f18914f8d7
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun May 4 11:59:34 2014 +0100

    imporvements to resolve editing differences form for pages still need to add diff

commit 95605b2d6b5ab1e8333a45f2af5131da2593ed79
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat May 3 17:22:40 2014 +0100

    got rid of extra migration for ldap

commit 33c9fcc19f6ac7c940e852796b01312913e90f5d
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat May 3 17:21:37 2014 +0100

    after reset to templeman

commit b59737e1c920d29052cf99fd0dafe6562d2353b3
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat May 3 12:59:00 2014 +0100

    With UK Templeman Library spac

commit 846cdb29c7a3b1c53936671f05c3c4caa6608d16
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat May 3 10:52:05 2014 +0100

    deleted some un-needed stuff from Page

commit fdef4b6ff5141e3ad018a7d6444588b50abaebea
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri May 2 23:05:41 2014 +0100

    turn off opt lock temporaily for page delete

commit 2296352d21c7f13b633476e102f8b05ed95ef946
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri May 2 22:46:20 2014 +0100

    step 1 adding page types hard set in controller

commit 3d396d688a6b0fdca721c27fb9baf1e06a224ae2
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri May 2 19:35:33 2014 +0100

    all working locks on pages

commit b2ab39fbc6bae810a451a7b1ee7aa33f17e34f13
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri May 2 17:45:36 2014 +0100

    after dave changes to optimisticly lock still fails on update no incr of lock_version

commit 9610c1804cf987a4ecd22906b640218aa1b46b6d
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri May 2 10:44:22 2014 +0100

    optimistic locking on pages working not ideal

commit 66236b3c05dff127da397a9021e15f8078b496b6
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu May 1 21:59:30 2014 +0100

    pre branch to ensure page is saved

commit 14975a18067ce01894882b2f58a6b7f0cfe43e37
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 29 21:47:09 2014 +0100

    page.reload added

commit 22ecbfec86fee82eadce208810d4253a061b1369
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 29 21:01:46 2014 +0100

    with lock_verion not updated unless title changes

commit f2eae444ef0b77c5ff4a47139a10a670265b7273
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 29 18:52:00 2014 +0100

    about to add optimistic locking

commit ce8d263663c8f9d4ef7dee2d602d8a995a34a576
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 26 11:42:22 2014 +0100

    fixed resource validation

commit eb5f994842208ab9ee8e3f53dab0b89483547984
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 25 23:03:35 2014 +0100

    twitter omniauth done plus some signup form etc ui layout

commit 089a988ac18ee219ff608e211512fa65f02d163d
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 25 19:00:44 2014 +0100

    omniauth now doesnt fail

commit 6616ac5db42eade5c35b01b1b5259dd3d61b8237
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 25 18:56:30 2014 +0100

    omniauth fails

commit 17a7c960bf6d6e5864a2514c6c4f720f950ad24e
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 24 18:59:27 2014 +0100

    removed remaining inline css from views

commit c9f7377c2996ff06bda9be512e5f14026568bd81
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 24 16:35:17 2014 +0100

    edited users index to get it working in the virt mus context

commit 8431d7b9d3c02300c52e21c6d0d9ca129a453bbd
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 24 12:14:05 2014 +0100

    all inline styles in views eradicated

commit 29849fe3bbe08ae9d76105eb773050961103004c
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 24 11:51:32 2014 +0100

    refactored app views resource somewhat

commit 6daccc060ca9a5c1c5adddf960ad801e27ea4c2e
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Apr 23 22:58:25 2014 +0100

    tidying the page header

commit 3856b12885ecba6db2723115c52235d735b54d91
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Apr 23 22:33:20 2014 +0100

    only three files in view remaining with inline css in resources dir

commit 06d17a3a01190d3013554962268960be80eafd51
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Apr 23 22:05:48 2014 +0100

    refactored app views comments

commit 1cef99cf8702df62c49e550a9855480ca3c978f1
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Apr 23 20:46:07 2014 +0100

    cleaned up _page_summary.html.haml

commit 696f891a35d0e38fa259e661816b84a87d60cbcd
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Apr 23 19:46:54 2014 +0100

    added 4 indexes to 3 tables

commit ca311a2db1bc00a78b29f3ecdaf92fb9c25aca8b
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Apr 21 20:15:34 2014 +0100

    about to remove friendly_id_slugs

commit 12ccd1fd4a0aee65f72031a2619a281dca4c8d2d
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 20 12:08:09 2014 +0100

    added responsible user to resource and started improving resource intance variable use for copyright etdand resource form for copyright adherence

commit 6e7306c90dc1395b6ca1df6db2bb54e1ea6411c6
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 20 01:09:18 2014 +0100

    got page summaries looking nicer

commit 47746c059e6ba68d8cf2b0bba909d5065fd37fe9
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 19 10:51:23 2014 +0100

    failed to get scrolling tickboxes aligned

commit a5e883530a305633b185caca2f869aa500f9b1e6
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 19 01:27:28 2014 +0100

    even more cleaned up page.css.scss

commit dad7933907952526e01329438adb5fe835263964
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 19 01:10:20 2014 +0100

    more cleaned up page.css.scss

commit 6ae39354de042b30331d815526dbd5dc630db871
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 19 00:55:02 2014 +0100

    cleaned up page.css.scss somewhat

commit 8f0604fcf68029b4023756e90d1c2f48d68c381e
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 18 22:59:59 2014 +0100

    still working on flash error messages everywhere This is before getting rid of original_title and adding titlke to Page

commit 3302b20123a21c753a34860f93648d84f478a410
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 18 22:51:17 2014 +0100

    resources 404 with a flash error message

commit 9d995efe743caeb5eb40c944fe4b44cba020aa7c
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 18 20:23:47 2014 +0100

    pre messing w error msg display

commit 9836c64a0d3be46c33dd90a325ccd7a06619d7eb
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 18 19:34:32 2014 +0100

    show comment author not field which is redundant now except that we may us it with oauth

commit cb756773b79eab82b2ba11504503bf6ee17df90b
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 18 19:22:31 2014 +0100

    small change to get commenting working again

commit 239ccf64bbb25234616cffa9667cdf5648c796ca
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 18 19:05:00 2014 +0100

    finished branch

commit d10f05ae202e28eef7e3fbd06d408ec59ad15ee0
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 18 17:25:06 2014 +0100

    made relove resources and remove pages redirct properly showing back as the url and tidied resource index page formatting

commit ea8a06f8f5fd3b581d3f446779e830677cfcd040
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 18 16:55:36 2014 +0100

    inmproved error messages and feedback on the page form

commit 6eafab069fa59ca7722855ad60ad7eb8c61a7d45
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 18 16:00:57 2014 +0100

    settled on validation that page titles must have different alpha numeric char sequences

commit c384fe393eafe030456641bffa9d717ffb1e02cb
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 18 14:48:21 2014 +0100

    slugging working

commit 5ccb71450523dcd52950a750adcfe0367663455b
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 18 14:02:56 2014 +0100

    got rid of friendly id made own for page ridicoulously easy

commit 24c6fcae94b3c087bcae736217371a8a78c2bc09
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 18 12:28:48 2014 +0100

    pre branch to master

commit cc321fcef00d71f9236eb4cb4030f0a655a6a8d0
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 17 18:15:44 2014 +0100

    push again with authorise mods

commit 00f2024739b9434be2cad7ffde859dee4cf20d7d
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 17 17:47:21 2014 +0100

    added auth to resources still to test

commit 55ebcf3797e22dd73a684f8c8cd6649bfd542ef2
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 17 17:43:12 2014 +0100

    pages controller checking auth nicely for all actions excep show and index where the check is not needed

commit a35ceba9bac931c49bbc96e65df1f2fbf0bda738
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 17 17:02:45 2014 +0100

    about to cean up pages controller

commit fc5c604c92eb19573dc9c2aa92f44bd7f401cbcc
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 17 12:22:13 2014 +0100

    added authority

commit 1338b674579dfac769c30e72054cf76770706241
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 17 12:14:05 2014 +0100

    added admin started admin-normal switcher

commit d1112cf4ae87653080afc66ceaec82363e3e4ace
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 17 11:36:11 2014 +0100

    about to add admin field to users

commit 2d40c164ceeb46d947f1e8dd829a821237f213b5
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Apr 16 20:56:26 2014 +0100

    added favicon

commit d73663cff3736f1dcc8141659c329e7631f55cf7
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Apr 16 00:52:08 2014 +0100

    got checkboxes updating

commit 48b5258b3f3addf21d2ce80a204a64d4bc64a247
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 15 22:21:45 2014 +0100

    a bit mroe erb to haml and resource pages title size change

commit c2ba73e773a0855ae7fdbc6cbc0b406a70ecc5f0
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 15 20:53:05 2014 +0100

    got multiple selections working on resource editing page

commit 273ecdeb666a9386d1ca9493a6188eb9d76cbf5c
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 15 19:15:44 2014 +0100

    got resources form working with a collection select

commit 4b8b16c97a7ef97e648752ef6c3b1b29a2b0d1ad
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 15 10:25:08 2014 +0100

    changed table name to resource_usages

commit fe0c83bad0059769f03862240237014e110d2c90
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 15 08:26:47 2014 +0100

    remove timestamp frm join table

commit 4d238363462d54b52c33ec05e254a7ff8f108a4f
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 15 08:20:19 2014 +0100

    removed timestamp from join table

commit 213ba10ed55f61f70a46e16c552016db1e32c5bb
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Apr 14 17:42:17 2014 +0100

    duh better add git add . to my commit script - herewith all the extra files from not adding

commit a8b6ca9eb5122e052b0920785a8897b26079a65a
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Apr 14 17:22:41 2014 +0100

    manual join table blues

commit 251d99666add5010f8827e47b22d3f2d146b1284
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Apr 14 11:54:20 2014 +0100

    believe I may have constructed 20140413184057_add_cols_to_resource.rb correctly prior to trying migration

commit ef4951af770fe33183d016c97e7dc8c35c489400
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 13 19:35:04 2014 +0100

    changed page header, title and added see all pages and resources

commit f479c7f6a199ed2e761c1811e89446e8f0dcc354
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 13 19:20:30 2014 +0100

    new page form now shoing page title

commit 57aed05db8cdd3ee218eb953ea3ba5c2f323c879
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 13 19:07:19 2014 +0100

    with page title not being seen in a new form as a TODO

commit fa9197546fb0ce677a1d2a7e1c75fee6205457a1
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 12 22:46:10 2014 +0100

    shows item catalogue number and location if categorised UMCS Collection

commit 6b5d2fa8b4eb246db6ed59c22278e583089d31d2
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 12 21:09:28 2014 +0100

    migrated for item number and location - editing form partial

commit 9d2ba2980630604ea177b55a5166cbb2c1abf9a6
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 12 20:48:34 2014 +0100

    more sorting resources

commit a6500d2937c6b844c89aeeaa50e8050dc4636de6
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 12 17:15:23 2014 +0100

    added resources (images) to pages

commit 33cadd65acbea9cc607e0f7871246b700b794cc9
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 12 09:15:34 2014 +0100

    added resource to page, think its time to get more of my tests working again

commit ac68a05aeb95e6352dc0326452cc27ebb8df0ca8
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 12 09:07:27 2014 +0100

    FileParser renamed DirectoryParser and put in app/helpers

commit 6df850ce5683ebd7d0ad25010fb1994692a1ecfb
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Apr 11 22:21:30 2014 +0100

    implemented FileParser in try5.rb, much better ruby style than prev attempts implementing part of Div

commit 898f16b975dabfb7426c33d2e41ab61086efedc2
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 8 23:45:49 2014 +0100

    final refactor try3.rb for day, not really satisfied how control flow in next is shown

commit 190d020492f3c23f3149575c536689f81c513984
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 8 23:30:17 2014 +0100

    added empty dir case to try3.rb and a bit of refac

commit ee8cf15ee84646f0de618dcd2f3a2044494c45f6
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 8 23:18:04 2014 +0100

    started spec and code for directory hierarchy traversal in try3.rb

commit be5068fb0a739ac4dfe2c25a6a56cf983f9ed3ea
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 8 20:02:34 2014 +0100

    finished PageState refactor (for the mo :)

commit 1eebc8f9e261a52ae9660b3716a93ac560da81bd
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 8 19:56:37 2014 +0100

    half way thru refactoring pagestate class

commit 79a021e7aa1dbe11021a138df841d9b4cf7e075b
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 8 19:14:00 2014 +0100

    dryer page.rb thanks to daves module HistoryControl

commit b33665900486bfc3a210893045fa0165d509bbf8
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 8 16:50:59 2014 +0100

    try3.rb / metaprogramming spike tidied up and to Qs inserted

commit 9c2c6c2cceea884c1b568dc24829d1524a7b982a
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 8 16:31:07 2014 +0100

    potential metaprogramming solution

commit 0d09b787c54e4f8e2ac7aa18893024a759892426
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 8 10:31:59 2014 +0100

    better metaprogramming try3.rb

commit a31766f3f89eea9a80b7427d686ab6015896c65c
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 8 10:02:27 2014 +0100

    getting to some metaprogramming in try3

commit 27e7b0ec77801936f68edbece9d7d1ef5de3dc82
Author: Mark Van <markfeedly@gmail.com>
Date:   Tue Apr 8 08:21:49 2014 +0100

    ready to refactor page.rb

commit f94c2c61421956b1aac1deff640ccdcfe708ce68
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Apr 7 23:40:56 2014 +0100

    faked up first conditional page content according to page type

commit 396ecfc84a1e7d2865c1956fc9df1d59507c5639
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Apr 7 22:47:58 2014 +0100

    two lines in page summaries

commit 7f6c77a0a9b9ffa1ccd4582648f8af099d5a730c
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Apr 7 22:16:27 2014 +0100

    comments refactored in page/show

commit 6676d2e3aa819286b590041aa4f964ab4f19b6bf
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Apr 7 22:00:13 2014 +0100

    cleaning views

commit 119f83d99be8d556605f921aad6ce6207928bb81
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Apr 7 21:23:54 2014 +0100

    even more squeakily clean in appearance

commit 2c059d0485bf0fa55166869089d3899bace3777d
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Apr 7 21:04:14 2014 +0100

    squeaky clean appearance

commit 6532784e601422bd4e7cf5742f928cb68e640199
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Apr 7 20:04:54 2014 +0100

    tags and categories now in block below content on main page

commit d24e39852d1ce20266bc3c1321135b4646d90604
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Apr 7 15:54:14 2014 +0100

    about to add a module for linked data

commit afbb7973cd1bf4c10e2f09b456e823f4fffd036d
Author: Mark Van <markfeedly@gmail.com>
Date:   Mon Apr 7 15:01:38 2014 +0100

    only got linked data in Page now (deleted from app helper)

commit f7f799a2b5e602f942e363241b25fa22a7c673b5
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 6 22:54:29 2014 +0100

    finding by category ie using CategoryController#show now works for categories higher up the tree

commit 0176a85d2522e80669f757e1f28a0c702924c711
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 6 20:30:01 2014 +0100

    got rid of cats in history showing tags, now show trails

commit 25a1df73319d5240f30fb439ed04ed8b064ad470
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 6 19:45:41 2014 +0100

    categories work showing trails and more work needed

commit 56966fab9073c56b358bbbda254a59caaff091cd
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 6 18:31:13 2014 +0100

    added time zones and app helper linked_data

commit 9253791d778c13b2f544a5aaa04c19c5b1121bc3
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 6 16:01:49 2014 +0100

    Page#tags change to get blank in new page tag form rather than empty brackets

commit 62e1f1eae466f3d2d5969445d7a3437406824d65
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 6 15:52:13 2014 +0100

    No tags is still being generated from two places

commit 197b0336ece83c43903de52cde651206d640e76e
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 6 15:24:00 2014 +0100

    tag code and disp cleanup

commit dae5a9b61b3506e341e4973ba622ba4b4de91646
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 6 13:44:42 2014 +0100

    used tags.css.scss to layout tag search page

commit 3b8f60d114c54afd10fd737fc221359d823b0c16
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 6 13:13:17 2014 +0100

    created new application view directories and moved partials around

commit 53ee7eeeb69f5c0e402647cc45da3bb2e7e1befb
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Apr 6 12:37:38 2014 +0100

    got bones of categories in try3

commit 16662d54aa0f83178ee48dc85dfadb1648958640
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 5 22:52:06 2014 +0100

    for now done formatting and css refactoring and move to more haml

commit e6c7199b5daf4cc4004471b1c07e9fe652646e3a
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 5 20:31:36 2014 +0100

    just a bit of formatting and css refactoring

commit 17f2075588353628bd7e7365352f9d66861693ec
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 5 19:46:17 2014 +0100

    broke it but works again

commit 96605973322d14bdb13352edc5f2530b9776fdff
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 5 18:41:04 2014 +0100

    continuing the change to haml, still have to deal w floated edit button

commit 3da3f99cb1681ba2b3d0da406cb2b2da6bdb200a
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 5 18:04:21 2014 +0100

    sucessful change to haml

commit 766e9988231715c23a6b5e226f35e44fe1b0f42f
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 5 17:44:27 2014 +0100

    works pre haml again

commit 0b9d3ae96d9e9030639f848640ac3771dbcf77f2
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Apr 5 13:16:34 2014 +0100

    before introducing haml

commit bd05374c1baf32ac100066b4668de6a7c79d7b25
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 3 19:21:58 2014 +0100

    finally got CommentsController#create to invoke creation with correct args

commit 9b23f3e8a449a737c17565b14b3e90935047d7c1
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 3 17:03:13 2014 +0100

    can add basic comments, ready to tweak

commit b30e447f5a90f8b5681110e29f63610656306d33
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 3 16:12:12 2014 +0100

    added comments, edited models, routes, about to add comments controller

commit 05eb343657b2cc1235f778a8fc4d7db97431ce50
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Apr 3 00:35:22 2014 +0100

    after a more formatting

commit 8e9dd85eed8b3062e6b5878d6b496b4d290970d6
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Apr 2 23:59:05 2014 +0100

    after a bit ov UI layout

commit 242cabcf66be4f0276aea66ebc8349e79140317c
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Apr 2 23:17:10 2014 +0100

    about to mess with _page_state

commit a690b8b1e33db36e5281f5a7d0e98c0c75aa1186
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Apr 2 20:20:12 2014 +0100

    sorted, unique tags

commit 481b0032b84eea0395c6d3239fb2974bbf3f4099
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Apr 2 14:23:24 2014 +0100

    tags as text

commit eaa6c53bf06ea5248b82138e8b1c50d22fc434e9
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Apr 2 12:18:46 2014 +0100

    back to beginning of tag branch Revert "committing forgotten files from tag model adds" This reverts commit 2833f7d45f8df3f43ac74806b4a2d6c0ae2a4b79.

commit 2833f7d45f8df3f43ac74806b4a2d6c0ae2a4b79
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Mar 29 23:04:59 2014 +0000

    committing forgotten files from tag model adds

commit f896b325e9a1e3f5563670c1c532e927023ac157
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Mar 29 23:00:56 2014 +0000

    added Tag and TagSet to model classes

commit f2274866b48296c3afb158ac06b694ff5880b3f9
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Mar 28 22:42:59 2014 +0000

    messing around with decorator and some view mechanisms

commit 6deea97a5503cc3d2e1b8c8fea650a65d563f919
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Mar 28 15:20:53 2014 +0000

    after daves help re unique titles in PageState

commit 9aeea9998d600e6a24bdd5dbb42f0bb567a8ad16
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Mar 27 15:46:20 2014 +0000

    finished, bar two pendings, content_html_generator_spec.rb and markdown w links working w non-embedded images and vids

commit e595c161c672b4c9d55f9cb9b5fb7c561718d99d
Author: Mark Van <markfeedly@gmail.com>
Date:   Thu Mar 27 12:36:27 2014 +0000

    getting towards using markdown sucessfully, working on embedded links, about to throw away paselet work

commit 2497dfdff59de5eb70f8fab84717bfcf6a421195
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Mar 26 23:46:24 2014 +0000

    checking on branching

commit 1666a00d3705f01543fdbbdc601e16ebfa8f67df
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Mar 26 22:10:24 2014 +0000

    now showing last diff for content in a tab, or none if new page

commit 82df2751e00f63834f3eedd08bd9814de1d2c433
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Mar 26 21:18:42 2014 +0000

    got my diffy spike working in pages/show.html.erb, next do someting useful with it

commit 03b1eb749e499fb5fc3c7d4c69d255e8cdb0171f
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Mar 26 21:13:53 2014 +0000

    order history in view correctly

commit effd7f4de636cc331a0871b6f83282926b52b3c8
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Mar 26 21:04:32 2014 +0000

    got rspec working again w slight refactor, parser spec needs attention still

commit 823bcd49218d4ac26fb835e389fa375d6a8014e2
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Mar 26 19:35:10 2014 +0000

    messing around with diffy, before trying to change retrieval order for pagestate

commit 0985e1aff6502e06535393e84166022980212f62
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Mar 26 18:14:58 2014 +0000

    paras are delimited by blank lines

commit d669dad1ac7c6f9a68ba45d00078cde572ffceb4
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Mar 26 17:41:36 2014 +0000

    slightly better page layout

commit cf51c3d8668d559d9e9d02bfa71213479c422b1f
Merge: 1509b2b c4d870e
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Mar 26 17:29:49 2014 +0000

    highlights unparsed paras when shoing page content

commit 1509b2bf90e17c9af2ec2e07ae849d5bf96d6e5f
Author: Mark Van <markfeedly@gmail.com>
Date:   Wed Mar 26 17:12:14 2014 +0000

    Multiple para content added

commit c4d870ed5d74ea82704fd1aa3323d373d26fa38f
Author: markfeedly <markfeedly@gmail.com>
Date:   Sun Mar 23 11:54:06 2014 +0000

    Update README.md

commit 10da93f624cea0ea8b968b597dc18d538bf24c10
Author: markfeedly <markfeedly@gmail.com>
Date:   Sun Mar 23 11:49:09 2014 +0000

    Update README.md

commit 00e98cdced83fb5e8e9f6a86767973751c49ef78
Author: Mark Van <markfeedly@gmail.com>
Date:   Sun Mar 16 14:14:10 2014 +0000

    created unique_page_titles_slugs_n_spec.rb

commit aa628a489493d0eb2fd577325ab57b046a23a6d6
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Mar 15 19:43:16 2014 +0000

    made partial to show title/content forms

commit 2ce9294faa2a0016720aba4d8ed44f17a80e281c
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Mar 15 18:42:56 2014 +0000

    added feature for unique edit of title, still to make it pass

commit 848497cb4f6401e4eb71cf9a02319a74d87ae975
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Mar 15 17:01:49 2014 +0000

    Added some cuc for page content type, needs better steps/xpath

commit c515d64a97218e6a57078ed29993cf9f8befced2
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Mar 15 15:22:10 2014 +0000

    after playing some more with page decorator

commit 7a188380b54c890c75f3728e9fb003795a3930a4
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Mar 15 14:13:34 2014 +0000

    added raw, tidied up page decorator use

commit 30ccd9c1d709dc191c857dff7ddfe1ecc92740ba
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Mar 15 13:31:13 2014 +0000

    added draper and a page decorator

commit 869b2ebfe8862d3095e26e652f5ccb8ff61cc9cf
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Mar 15 10:54:52 2014 +0000

    created helper module for page, to obtain safe html as an epx w helpers

commit 33c1e8c97bc9d7fd1f137064449b97f4a6190e6e
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Mar 15 09:48:53 2014 +0000

    better form \buttons'

commit e11586598974c09a30dfb97a7cfdc2a39c477686
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Mar 15 09:28:17 2014 +0000

    better sanetize done before pagestate validation

commit c644ac41ce526c5f989de02c06cbd2a91e63350a
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Mar 15 02:55:34 2014 +0000

    v basic xss protection for content, still missing for title

commit 40e4e1ba1ed162314132afa16b4a9b865b63fa2d
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Mar 15 01:31:52 2014 +0000

    formatted uls on home page and history tab, history shows rendered page content

commit 6244d7ebbc51fc7aa6ff2b40f67676ea7f7194b7
Author: Mark Van <markfeedly@gmail.com>
Date:   Sat Mar 15 01:08:45 2014 +0000

    added contents of history tab

commit 067e85e9c6df5fa492454856bb1649dfc15b992d
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Mar 14 23:45:40 2014 +0000

    decent exposeure used for home page controller and view

commit b2cce886327c63d4a709cf5de12c3a3ea08dbfe5
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Mar 14 23:41:42 2014 +0000

    decent exposreu used for page controllers and views

commit f30954f6e8ca10357adc35a8dd1d325604c4f193
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Mar 14 21:52:58 2014 +0000

    got cuc passing, @wip on two devise scenarios

commit 17c69a6d8e5f241a180a554bd3ab40847c0483a8
Author: Mark Van <markfeedly@gmail.com>
Date:   Fri Mar 14 19:49:49 2014 +0000

    Daves fix for the mysterious cucumber drops connections, plus some cuc fixes by me and tidy of splash page

commit 8c45bacf694cb0b4fd10275611c742425f3b5ec4
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Tue Mar 4 07:21:15 2014 +0000

    added tabs to pages, smartened up home page in various ways, changed header bar

commit a4fb7ba418286df118ef74cc11c68c2e0d360264
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Mon Mar 3 11:33:24 2014 +0000

    all rspec passes

commit 878a2deb132db9e07b0ddeae00e9884440cb0ddb
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Mon Mar 3 10:26:36 2014 +0000

    post hoc addition of content transformer rspec

commit d299c438596587b844859e336efd29be51f3e786
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Mon Mar 3 09:54:41 2014 +0000

    rspec for ContentParser actions added

commit ae09f8f9419639c5514ced79fa5931fcca4d9171
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sun Mar 2 20:46:09 2014 +0000

    minor refactor app/helpers/content_generator.rb to simplify code there

commit dd776a1cee9bbfff1804e6071f788623b8234972
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sun Mar 2 20:36:33 2014 +0000

    got working with all page content except vimeo, needs work on rspec and cuc (nb reinstall cucumber)

commit 7861ccf7b639670b5093e62ac2e2fe6438b297b7
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Fri Feb 28 23:07:13 2014 +0000

    getting near end of LinkInterpreter dev and tests

commit 3be5797b7fc88c96e86304c4deedc2a375b127cf
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Fri Feb 28 17:27:32 2014 +0000

    after an rspec refactor

commit 9ceef7fda0b2a605c791d86c8c0ac0513ff4360d
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Fri Feb 28 11:49:17 2014 +0000

    LinkInterpreter boolen methods implemented w tests

commit 59014a2f1fd5432b174c34469b819adb39710d71
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Feb 27 11:09:06 2014 +0000

    created helper class to invoke parser, still wont run

commit 0e6badc0f045cacc979f91d6f86537d7c3206cf1
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Wed Feb 26 23:15:11 2014 +0000

    after addition of parslet imlemented parser and transformer to code, not working yet

commit 4e88c11661f1e04d932726d462410c1f4011f2e0
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Wed Feb 26 19:09:47 2014 +0000

    before large refactor of parselet grammar

commit 835792fabce433e95d6f9b4c5a70427291addd1e
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sun Feb 23 11:39:03 2014 +0000

    beefed up parselet to allow hyperlink at start of content, next step use this code

commit bda994eb19cece5aa7752ae4aa45ef72a30b704b
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Fri Feb 21 19:11:31 2014 +0000

    got page state spec working

commit c7c66dac49cbd7e4735383fa0c843b795c155102
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Fri Feb 21 19:04:02 2014 +0000

    tidy page spec again

commit 16de75d887d94e78d84188f78325cc66c2e05081
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Fri Feb 21 19:01:59 2014 +0000

    tidy page spec

commit e9852540e1e84835e3051da6dc6580b26b2c8c0b
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Fri Feb 21 18:56:05 2014 +0000

    tests in models page_spec.rb now working

commit 5b9a1b317b79063a6bad32b90d3a2b8dd2ef4aa6
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Fri Feb 21 15:42:43 2014 +0000

    got page creators and editors spec to pass after active record refactor

commit cffe5593f26d1bdceaf8eab0eab0dad0a83bf904
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Wed Feb 19 13:18:57 2014 +0000

    ready for navoidable refactor to nite pages and prev pages

commit 66852115b1032fda9daa9c4e4b2376ecfa95522d
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Feb 13 17:06:29 2014 +0000

    failing to connect to test db

commit 12577c88d1dc81b5f815a69607bc373a3f5d5166
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Mon Dec 2 22:28:57 2013 +0000

    parslet post url in try.rb

commit a260e4584a0eaf1cbd698e22a00169a97a77a86a
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Mon Dec 2 22:27:44 2013 +0000

    parselet experiment in try.rb

commit ff8733633631b366a0a860a33d14ba618b486df3
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Mon Dec 2 07:04:26 2013 +0000

    TODOs added, ready for a few days break from this

commit f159b65422800c803e667c016ff0f0c7a4607e5b
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Mon Dec 2 00:07:42 2013 +0000

    found a failing test in Wiki Page - Edit page title in features/pages/add_page.feature

commit b59cc20fe1c900fdb3a4d885ff01c5c71d9de39f
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sun Dec 1 23:41:08 2013 +0000

    wiki functionality working, need to add history

commit fed6c2bcf01be76612f8f6973620f4eb04d1ce10
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sun Dec 1 23:05:39 2013 +0000

    wiki functionality working, need to add history

commit f85bda6c11583b60a016d8f42e628a0bd864b22f
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sun Dec 1 18:20:08 2013 +0000

    before refcatoring Page#parse_content

commit f180608364445bc66c6a7e281bdba471a1a1602f
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sun Dec 1 18:15:51 2013 +0000

    before refcatoring Page#parse_content

commit 2f4b112e6c284cf776c31b8f71676c44f35bc4a4
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sun Dec 1 00:30:50 2013 +0000

    seem to have Page model returning slugs in content

commit 1f939d61fa6f9e566ca02c419a66ecacc9a2059e
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 28 02:14:00 2013 +0000

    all rspec passes for new creator and (last) editor, still need TODO tests, refactor some names maybe

commit f56394ff6f0fbe9e32a124df09cb9a680b106c5b
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 28 00:18:14 2013 +0000

    Page#change partiall tested, see updated TODO

commit 0c3ffbb570f168e1dd52d1a0131c57b73af55c50
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 28 00:04:10 2013 +0000

    creators and editors done, before merge of Page#change_title and Page#change_content

commit 380cb9337b0a67e30972b3012af011112e7fa80d
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Wed Nov 27 23:59:04 2013 +0000

    creators and editors done, before merge of Page#change_title and Page#change_content

commit 42155dca38551b47f8ec78eef39a465737d79476
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Wed Nov 27 22:40:21 2013 +0000

    cuc and rake working, before more rspec on creators and editors

commit 83fffda8039b2853a2124ceecd9e3c49197e4143
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Wed Nov 27 20:46:25 2013 +0000

    a bit more refactoring of spec/models/page_spec.rb

commit 53fc9b17a3adea856ae25b8bcc66167d7f26c4c9
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Wed Nov 27 11:28:00 2013 +0000

    a bit more refactoring of spec/models/page_spec.rb

commit dc5b593c4d333936fece46b894bc82dfdca9381f
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Wed Nov 27 11:23:59 2013 +0000

    spec/models/page_spec.rb

commit 7427d1eb7a0dd8914174639190ca48a9a669ac4d
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Wed Nov 27 01:19:00 2013 +0000

    spec/models/page_spec.rb

commit f572f86035c2b66042da6c5e437e8181205e573e
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Tue Nov 26 01:46:21 2013 +0000

    haz i got the history models done?

commit 731237126ada4959807aad302613a25814f378ab
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Mon Nov 25 22:13:21 2013 +0000

    ready for migrate to add previous pages

commit b0ed2cbee7f330813ea768f813334b656550f4aa
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Mon Nov 25 21:23:00 2013 +0000

    no real change, but before generating PageContent model

commit c9fbff922bf531256ae0169fc30f292fb51ad05f
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Mon Nov 25 21:02:21 2013 +0000

    refactored cucumber page_feature

commit ef0b12c1ac3ff45ad29ddc0124d0a1be09e6ce0e
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sun Nov 24 21:42:13 2013 +0000

    moved on to rspec to develop page history

commit 9ce3e7d76303d7495a6b19d01049f3a73709cb4b
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sat Nov 23 23:50:54 2013 +0000

    edit pages, still to improve tests - done in advance of tests

commit b197199b364ea9feb3e3b47f1447bee1a4c9d4df
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sat Nov 23 22:04:17 2013 +0000

    it worked

commit 46c995903b92f8d4f01a14a809f958c3c07e5986
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sat Nov 23 22:02:58 2013 +0000

    this should work

commit 03f9123e7faa512db88fd119fc6ffc32c6808dbc
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sat Nov 23 21:53:56 2013 +0000

     test this

commit 8b65062e07ed819f518ab11cb07e8196289dafba
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sat Nov 23 21:50:26 2013 +0000

    pushtest

commit b81fc95d94964accba5b58d957191e8bda1b3f91
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sat Nov 23 21:43:58 2013 +0000

    page name changed to title

commit 7eda56137d49146d5f58535616d7c56b362cf079
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sat Nov 23 21:20:59 2013 +0000

    before refactor of Page name to page title

commit b00d3a42896721631adea757864d2f2284e7112a
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sat Nov 23 20:27:32 2013 +0000

    new page w friendly id tests passing after migrating RAILS_ENV=test, launchy added

commit ccebd6ecba2fb4c5500eaf22db0c001bfa498d2a
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sat Nov 23 17:13:02 2013 +0000

    database cleaner works

commit 1ae2c26db73223ff3b28d531c913912e449363ac
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sat Nov 23 13:59:53 2013 +0000

    Tests pass for add page / add a page the see it

commit 78325ab1f3841a20f338c68d39cf85d66230c8aa
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sat Nov 23 13:10:22 2013 +0000

    failed to get database_cleaner to work properly

commit 97ed20adcd71b23f69b3766543fe771db441583b
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Sat Nov 23 01:10:39 2013 +0000

    after rake db:test:prepare

commit b74125e2c608532a80bb713e5175a202446a9f61
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Fri Nov 22 20:22:40 2013 +0000

    before developing new page features views and controller

commit 46fda448e76502052d54c0eebe5f3da60364c513
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Fri Nov 22 19:28:32 2013 +0000

    got as far as an add page button, need ot generate a pages controller etc

commit f6e6acb55e4f7ef33c87d966c723bbb9ede8610f
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Fri Nov 22 18:47:35 2013 +0000

    cucumber problem resolved by removing a require in factories.rb

commit ed1f1c5b13374a226db3358474d0aa0338768d93
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Fri Nov 22 16:57:28 2013 +0000

    wierd cucumber bug

commit ce85cebc5d7788e8ab51a627f8e25ef8b7ae4fc9
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Tue Nov 19 18:20:18 2013 +0000

    with unregistered user factory problem

commit d3eb2f4305c84eee65b6b54511268ea26d008240
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Tue Nov 19 17:44:04 2013 +0000

    ditto before rake rspec:install

commit b307145f2a62d872fa510ec101c5127bb06b9d03
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Tue Nov 19 17:43:20 2013 +0000

    changes before running rake rspec:install

commit b99e9b7d08700718617738bbbebeb1cc1757dca2
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 16:26:39 2013 +0000

    created rails app with rails composer

commit 78bb76c04cfc01fdb0264c1587e5a6cb3b7032d2
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 13:36:43 2013 +0000

    rails_apps_composer: extras

commit 7c088268edb4c43dd69d4c78e2e3e36ed3c95d00
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 13:36:43 2013 +0000

    rails_apps_composer: set up database

commit 2c9b4f8f4369504f045cba465426fb5797fcf799
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 13:36:33 2013 +0000

    rails_apps_composer: cucumber files

commit 372a2ad87ca2e5e24e4cbb07515624421f98c432
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 13:36:31 2013 +0000

    rails_apps_composer: rspec files

commit 48ea40fafc31883b6d46e35f8094f478eea9db1c
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 13:36:30 2013 +0000

    rails_apps_composer: add README files

commit 4b28b4651e52620764261a80e2fe1c575da4e687
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 13:36:29 2013 +0000

    rails_apps_composer: front-end framework

commit 5cd2833134870c849f42fb162a7337d73a6bf70a
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 13:36:26 2013 +0000

    rails_apps_composer: routes

commit b0a6cd5b766d49a92b9716568451bc8395da9f9d
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 13:36:26 2013 +0000

    rails_apps_composer: views

commit ae50fde707bff898312ff86c72f4de42a77104b4
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 13:36:23 2013 +0000

    rails_apps_composer: controllers

commit d5ab3a069cd9bf143b9320f40711ac2e35034f67
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 13:36:20 2013 +0000

    rails_apps_composer: models

commit 794fd213bd31756465fae3d1a633fd1d31b6e075
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 13:36:07 2013 +0000

    rails_apps_composer: testing framework

commit dea4c9c5fd0c5075e56df1c4cc2ab48e5d44ed76
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 13:35:57 2013 +0000

    rails_apps_composer: generators

commit 8e976db7fffd2083b61e73f66451ce70df8f7d89
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 13:35:52 2013 +0000

    rails_apps_composer: create database

commit 398a019bc5cfc36a0c2b71ac049f7d2e34513f9b
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 13:33:06 2013 +0000

    rails_apps_composer: Gemfile

commit 90d07c251294dff5075c53aac9cebb82a225bd19
Author: Mark Feedly <markfeedly@gmail.com>
Date:   Thu Nov 14 12:54:42 2013 +0000

    rails_apps_composer: initial commit
