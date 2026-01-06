function keyReleasedCallback(src, event)
    g = guidata(src);
    if strcmp(event.Key, 'leftarrow') || strcmp(event.Key, 'rightarrow')
        g.player.speed = 0;
    end
    guidata(src, g);
end