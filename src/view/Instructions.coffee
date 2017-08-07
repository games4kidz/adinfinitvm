module.exports = class Instructions
  withDashes = (string) -> "— #{string} —"

  constructor: () ->
    @dom = document.getElementById('instructions')

  start: (level) ->
    @setMessage(@startMessage(level))

  end: (level) ->
    @setMessage(@endMessage(level))

  setMessage: (m) ->
    @dom.innerHTML = m if m?

  startMessage: (level) ->
    switch level
      when 0 then null
      when 1 then withDashes "Versuch' dieses hier"
      when 2 then withDashes """
          Sieht hübsch aus, oder? Klicke auf das Element in der Mitte unten, um zwei Ringe herzustellen
        """
      when 3 then withDashes "Es kann mehrere Schleifen geben. So wie in diesem Beispiel"
      when 4 then "(Das Spiel heißt ADINFINITVM, alles klar?)"
      when 5 then withDashes "Schau mal, wie weit du kommst"
      when 7 then """
        (Hinweis: Es gibt einen alternativen Modus. Klicke dafür auf das ♦ rechts unten)
        """
      else "&nbsp;"

  endMessage: (level) ->
    switch level
      when    0 then withDashes "Nun klicke irgendwo, um zum nächsten Level zu gelangen"
      when   10 then withDashes "#10 schon. Das machst du gut!"
      when   50 then withDashes "Toll! #50"
      when 1337 then withDashes "#1337 — 11100010 10011101 10100100"
      else
#        if "#{level}".match(/^[15]0+$/)
#          @tweetMessage(level)
#        else
          withDashes "##{level}"

  tweetMessage: (level) ->
    tweet = "I've just completed level #{level} in @amoebe's #adinfinitvm game!
             https://bxt.github.io/adinfinitvm/"
    link = "http://twitter.com/home?status=#{encodeURIComponent(tweet)}"
    withDashes """
      congratulations! you have completed ##{level}.
      <a class="button" href="#{link}" target="_blank">tweet</a>
    """
