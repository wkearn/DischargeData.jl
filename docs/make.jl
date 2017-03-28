using Documenter, DischargeData

makedocs()

deploydocs(deps=Deps.pip("mkdocs","python-markdown-math"),
           repo="github.com/wkearn/DischargeData.jl.git",
           julia = "release"
)
           
