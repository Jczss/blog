# taglist function
function hfun_serieslist()::String
  # -----------------------------------------
  # Part1: Retrieve all pages associated with
  #  the tag & sort them
  # -----------------------------------------
  # retrieve the tag string
  tag = locvar(:fd_tag)
  # recover the relative paths to all pages that have that
  # tag, these are paths like /blog/page1
  rpaths = globvar("fd_tag_pages")[tag]
  # you might want to sort these pages by chronological order
  # you could also only show the most recent 5 etc...
  sorter(p) = begin
      # retrieve the "date" field of the page if defined, otherwise
      # use the date of creation of the file
      pvd = pagevar(p, :date)
      if isnothing(pvd)
          return Date(Dates.unix2datetime(stat(p * ".md").ctime))
      end
      return pvd
  end
  sort!(rpaths, by=sorter)

  # --------------------------------
  # Part2: Write the HTML to plug in
  # --------------------------------
  # instantiate a buffer in which we will write the HTML
  # to plug in the tag page
  c = IOBuffer()
  write(c, "<ul>")
  # go over all paths
    for rpath in rpaths
      # recover the url corresponding to the rpath
      url = get_url(rpath)
      # recover the title of the page if there is one defined,
      # if there isn't, fallback on the path to the page
      title = pagevar(rpath, "title")
      if isnothing(title)
          title = "/$rpath/"
      end
      # write some appropriate HTML
      write(c, "<li><p><a href=\"$url\">$title</a></p></li>")
  end
  # finish the HTML
  write(c, "</ul>")
  # return the HTML string
  return String(take!(c))
end

# taglist function
function hfun_custom_taglist()::String
  # -----------------------------------------
  # Part1: Retrieve all pages associated with
  #  the tag & sort them
  # -----------------------------------------
  # retrieve the tag string
  tag = locvar(:fd_tag)
  # recover the relative paths to all pages that have that
  # tag, these are paths like /blog/page1
  rpaths = globvar("fd_tag_pages")[tag]
  # you might want to sort these pages by chronological order
  # you could also only show the most recent 5 etc...
  sorter(p) = begin
      # retrieve the "date" field of the page if defined, otherwise
      # use the date of creation of the file
      pvd = pagevar(p, :date)
      if isnothing(pvd)
          return Date(Dates.unix2datetime(stat(p * ".md").ctime))
      end
      return pvd
  end
  sort!(rpaths, by=sorter, rev=true)

  # --------------------------------
  # Part2: Write the HTML to plug in
  # --------------------------------
  # instantiate a buffer in which we will write the HTML
  # to plug in the tag page
  c = IOBuffer()
  write(c, "<ul>")
  # go over all paths
    for i in 1:min(3, length(rpaths))
      rpath = rpaths[i]
      # recover the url corresponding to the rpath
      url = get_url(rpath)
      # recover the title of the page if there is one defined,
      # if there isn't, fallback on the path to the page
      title = pagevar(rpath, "title")
      if isnothing(title)
          title = "/$rpath/"
      end
      # write some appropriate HTML
      write(c, "<li><p><a href=\"$url\">$title</a></p></li>")
  end
  # finish the HTML
  write(c, "</ul>")
  # return the HTML string
  return String(take!(c))
end

function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  return "<a href=\"www.baudu.com\">$(pagevar(vname[2], vname[1]))</a>"
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end
