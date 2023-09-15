# file<-list.files(path = "/book_output", pattern = ".tex",full.names = TRUE,include.dirs = TRUE)
# grep is better than which. See https://github.com/rstudio/bookdown/issues/417

x <- xfun::read_utf8("book_output/agfun.tex")

exer_start <- which(x=="\\begin{exercise}")
exer_end <- which(x=="\\end{exercise}")

enum_start <- grep("begin\\{enum", x)
enum_end <- grep("end\\{enum", x)

num_of_exer<-length(exer_start)

for (i in 1:num_of_exer) {
  start<-exer_start[i]
  end<-exer_end[i]
  exer_env<-x[start:end]
  num_items<-length(grep("item", exer_env))
  if (num_items<=4) {
    enum<-grep("enumerate", x[start:end])+start-1
    x[enum]<- gsub('enumerate', 'enumerate*', x[enum])
  }
}

xfun::write_utf8(x,"book_output/agfun.tex")

# tinytex::xelatex("book_output/agfun.tex")
