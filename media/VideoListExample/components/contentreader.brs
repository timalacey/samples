sub init()
  m.top.functionName = "getcontent"
end sub

sub getcontent()
  content = createObject("roSGNode", "ContentNode")

  body = parseJson(ReadAsciiFile("pkg:/components/content.json")) ' based on https://github.com/Dash-Industry-Forum/dash.js/blob/development/samples/dash-if-reference-player/app/sources.json
  for each section in body.items
    if section.enabled <> false
      for each item in section.submenu
        if item.enabled <> false
          itemContent = content.createChild("ContentNode")
          itemContent.setFields({
            "title": section.name + "|" + item.name
            "description": item.description
            "url": item.url
          })
        end if
      end for
    end if
  end for

  m.top.content = content
end sub