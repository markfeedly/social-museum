##Introduction

This special purpose wiki provides a virtual museum to display physical or virtual collection items and related information. The information here is intended to be crowdsourced. The wiki provides various facilities to aid in that process.

You can read this wiki, navigating through it, without signing in.

To contribute to the content and comment on content, you need to sign in. If you don't have an account yet sign up for one, confirm your e-mail address via an e-mail that we send you, and then sign in. It's an easy process. Just check your spam folder if you don't see a confirmation e-mail.

##Pages

Collection items, innovations, people, other information and resources are displayed using pages that can be interlinked, so users can navigate through the information in this system. 

Each page has a unique title, and some descriptive content. 

The content may contain links to other pages (see 'Links' below) to enable navigation between pages. 

The content may also, besides text, contain links to external sites, embedded images, gifs, and Youtube and Vimeo videos.

Pages can be categorised in different ways, to add an extra layer of navigability. Categories may have subcategories according to a scheme decided for the content of the virtual museum by an administrator. Further categories can also be created by normal signed in users.

Pages may also be tagged. Using tags is intended as a more informal mechanism than using categories. For example, if a user might tag a page as 'awesome', but it is unlikely that this would be appropriate as a category.
 
##The Collection
 
The collection is displayed one item per page. The 'Collection' menu item above shows all collection items.

Collection items are distinguished by having a item number and a location (which assumes items in the collection are physical objects, stored or displayed somewhere). Use some sensible location, even if that means using a URL or permalink to the item.

##Innovations

If anything is categorised with 'Innovation' it will show up as an innovation when the 'Innovations' menu item (at the top of each page) is clicked.

##People

If anything is categorised with 'Person' it will show up as an innovation when the 'People' menu item (at the top of each page) is clicked.

Obviously. only categorise a page in this way if it describes a person (or group of people)

## Other information

There may be pages of information that are not specifically about collection items, innovations or people. These pages could provide background information about the collection and collection items. E.g. a manufacturing technique used in the creation of a collection item.

##Resources

Resources provide additional information. They are designed to be attached to collection items or other pages of information (for innovations, people, background information, etc).

Thus a document which is a resource might be attached to a collection item. It will be visible under the collection item's 'Resources' tab.

##Formatting content

The descriptive content for pages is formatted using a language called Markdown. Use Markdown when editing descriptive content.

A brief guide follows.

Titles, for successive levels start the line with # ## and ###. # for the largest title, ### is for the smallest title.

List items start with * or - with blank lines above and below the list.

A quote starts with > with blank lines above and below the quote, thus

> Quote text

Repeat this for successive quoted paragraphs.

Google markdown for more formatting information or see the
[href://http://daringfireball.net/projects/markdown/syntax Markdown Documentation]

## Links

You can create links within a collection item's (or other page 's) descriptive content. When a user clicks on a hyperlink s/he is taken to the referenced page.

You can also make a link to a resource.

All you need to do is enter this into your text

- \[A page, collection item or resource title\]

Thus:

- \[existing page name\] to create a link to another page.
- \[new page name\] for a new page.

## Don't change page or resource titles without thinking twice

When you are editing a page, please be aware that if you change the page name, you will break any  links to the page that appear on other pages.

##Other kinds of page content

Page content may augmented by making other uses of square brackets
written using non-Markdown directives inside square brackets.


## Links to pages on the web

Put links to other pages on the web in text:

- \[url optional-display-text\] to to create a link to a page on the web. The URL must begin with http or https. The URL will be displayed unless the optional display text is supplied. If the optional text is supplied it will be shown instead of the URL.

## Embedding images and videos in descriptive content

For images, YouTube videos, or Vimeo videos the following should be on lines by themselves

- \[url-for-image optional-width\]
- \[url-for-youtube-video optional-width\]
- \[url-for-vimeo-video optional-width\]

## Embedding resource images and documents

Still somewhat experimental, resource names should start with a single underscore. If a resource title appears in square brackets, a link to the resource will be displayed. Thus


If the name is preceded by a further underscore (using two underscores in total), then the resource content will be embedded. Thus to show a picture


##New paragraphs

Make sure that there is a blank line between paragraphs when editing descriptive content.

## Displaying square brackets in your text

If you need to show square brackets in your text, e.g., van Harmelen \[2006\] then put a backslash before each square bracket, thus

- van Harmelen \\\[2006\\\]

## Displaying backslashes and underscores in your text

If you need to show square brackets in your text, e.g., windows\_directory\\windows\_file then use two backslashes thus

- windows\\\_directory\\\\windows\\\_file

