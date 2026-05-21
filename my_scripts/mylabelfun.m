function labels = mylabelfun(vals)
labels = vals + " m";
labels(vals < 0) = "";
end