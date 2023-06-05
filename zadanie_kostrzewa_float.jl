using Plots; gr()

x_0 = 0.0
y_0 = 0.0
xs = [x_0]
ys = [y_0]

function agent_step(x_0, y_0, r)
    xs = LinRange(-r, r, 1000)
    ys = LinRange(-r, r, 1000)
    dx = rand(xs)
    dy = rand(ys)
    x = x_0 + dx
    y = y_0 + dy
    return x, y
end

for i in 1:100
    x_nowy, y_nowy = agent_step(xs[end], ys[end], 1)
    if x_nowy^2 + y_nowy^2 < 25
        push!(xs, x_nowy)
        push!(ys, y_nowy)
    else
        push!(xs, x_nowy)
        push!(ys, y_nowy)
        break
    end
end

function circleShape(x_0, y_0, r)
    α = LinRange(0, 2*π, 500)
    x_0 .+ r*sin.(α), y_0 .+ r*cos.(α)
end


plot(circleShape(0,0,5), seriestype=[:shape,], title = "Spacer agenta", lw=0.5, c=:blue, linecolor=:black, legend=false, fillalpha=0.1, aspect_ratio=1)

a = Animation()
for indeks in 1:(length(xs)-1)
    plt = plot!(xs[indeks:(indeks+1)], ys[indeks:(indeks+1)], ylim=(minimum(ys)-5, maximum(ys)+5), xlim=(minimum(xs)-5, maximum(xs)+5), color="red", legend=false)
    frame(a, plt)
end

gif(a, fps=5)

function mierzenie_czasu(x_0, y_0, r, fps)
    xs = [x_0]
    ys = [y_0]
    for i in 1:100
        x_nowy, y_nowy = agent_step(xs[end], ys[end],1)
        if x_nowy^2 + y_nowy^2 < r^2
            push!(xs, x_nowy)
            push!(ys, y_nowy)
        else
            push!(xs, x_nowy)
            push!(ys, y_nowy)
            break
        end
    end
    time = length(xs) * 1/fps
    return time
end

function sr_czas(x_0, y_0, r, fps, n)
    calk_czas = 0
    for i in 1:n
        calk_czas += mierzenie_czasu(x_0, y_0, r, fps)
    end
    return calk_czas / n
end

println(sr_czas(0.0,0.0,8,5,100))




