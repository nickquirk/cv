// cv.typ: the general CV, rendered straight from content.typ.
#import "template.typ": *
#import "content.typ": base

#show: cv.with(name: base.name)

#render(base)
