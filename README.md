# Impression #

*A domain specific language for resume / curriculum vitae style documents.*


## Motivation ##

Impression attempts to categorize the types of content in a resume / curriculum vitae so as to provide a language for describing said document concisely. Documents designed in this language may then be styled in one of many ways depending on the goal of the document at hand.

Perhaps you wish to design a compact, one-page document which will attract the attention of recruiters at your local career fair. The style of such a document would be distinct from the style necessary to cleanly represent a professor's academic history in their curriculum vitae. However, the language expressing both documents is the same.

The documents described here are meant to be exist in their own right and as such Impression's core DSP is represented as a class file which is then aptly styled by style files. This is similar to the construction of [moderncv](), however as you'll see Impression has a different flavor to its construction.

## Document Structure ##

At the highest level and Impression document has two structural components: the title and sections. Both of these act as one might expect, with \maketitle using a few high level declarations to compile the head matter of a document and \section segmenting the document in to large pieces. 

Unlike most other LaTeX classes there is no \subsection, \subsubsection, etc. Instead, the next layer of hierarchy consists of eight environments representing the types of entries which can occur in this type of document. Those are: *post*, *position*, *event*, *topic*, *member*, *affiliation*, *dated*, *entry*. These eight environments are constructed based on the identifying matter for each entry.

In general, content of this kind is divided in to chucks which may be labeled with a title, affiliation, and date (range). These eight environments represent the possible combinations of these three pieces of information.

- T T T -- post
 
- T T F -- position
- T F T -- event
- T F F -- topic
- F T T -- member
- F T F -- affiliation
- F F T -- dated
- F F F -- entry
 
## Usage ##

Here we explain each section a little more in detail and give snippets as for their usage.

### Title ###

By default Impression has commands built for the following information: your name, phone number, address, email, and website. A style file may include further information as needed for the purpose, but those five pieces of information are the least common denominator provided.

    \name    {Wile E. Coyote}
    \phone   {555.555.5555}
    \address {Desert Scenery, Somewhere Unknown}
    \email   {coyote@acme.com}
    \website {acme.com/~coyote}
    
    \begin{document}
    \maketitle

Note that styles are free to omit this information but are discouraged from doing so. Its possible to decouple the style of a title block from the style of the remainder of the document, or to override the provided title style.

### Environments ###

The most general and most often used environment is the *post* environment.

    \begin{post}
    {Position Title}
    {Position Affiliation}
    {Begin}{End}
    Information regarding the post. May contain lists / arbitrary latex.
    \end{post}

Note that the date range is expressed using two arguments. This arose during early experiments in which significant interest was expressed in styling the beginning date differently that the ending date (so as to place the ending date more prominently).

Two other common environments are the *topic* and *entry* environments.

	\begin{topic}
    {Topic Heading}
    Titled content
    \end{topic}

    \begin{entry}
    Untitled, "floating" content
    \end{entry}

The other environments exist for completeness and their existence will be questioned in a future iteration.