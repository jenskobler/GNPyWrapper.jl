using Documenter, GNPyWrapper

makedocs(sitename="GNPyWrapper.jl",
    pages = [
        "Introduction" => "index.md",
        "Usage" => "usage.md",
        "API" => "API.md"
    ])

 deploydocs(
     repo = "github.com/UniStuttgart-IKR/GNPyWrapper.jl.git",
 )

