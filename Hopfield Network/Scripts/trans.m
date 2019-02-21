%% Transforms 1024-dim pattern to 32x32 image
function trans(x)
imagesc(reshape(x,32,32));
end
