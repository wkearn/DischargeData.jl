using Documenter, TidalFluxQuantities

makedocs()

deploydocs(deps=Deps.pip("mkdocs","python-markdown-math"),
           repo="github.com/wkearn/TidalFluxQuantities.jl.git",
           julia = "release"
)
           
