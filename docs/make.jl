using Documenter, DischargeData

makedocs()

deploydocs(deps=Deps.pip("mkdocs"),
           repo="github.com/wkearn/DischargeData.jl.git",
           julia = "release"
)
           
