public final class Circle extends CircleShape
{
    public Circle(final CircleData data)
    {
        super(data);
    }
}

public final class CircleData
{
    public final Vector2 center;
    public final float radius;

    public CircleData(Vector2 center, float radius)
    {
        this.center = center;
        this.radius = radius;
    }
}

private class CircleShape implements Shape
{
    private final CircleData data;

    public CircleShape(final CircleData data)
    {
        this.data = data;
    }

    @Override
    public final void show()
    {
        ellipse(this.data.center.getX(), this.data.center.getY(), this.data.radius, this.data.radius);
    }
}
