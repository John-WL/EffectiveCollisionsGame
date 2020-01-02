public final class CollisionArea
{
    private final Shape collisionShape;
    private final Set<Particle> particles;

    public CollisionArea(final Set<Particle> particles, final Shape collisionShape)
    {
        this.collisionShape = collisionShape;
        this.particles = particles;
    }

    public Collection<Collision> getCollisions()
    {
        final Set<Collision> collisions = new HashSet<Collision>();
        final Set<Particle> remainingParticles = new HashSet<Particle>(this.particles);
        for(final Particle firstParticle: new HashSet<Particle>(this.particles))
        {
            remainingParticles.remove(firstParticle);
            for(final Particle secondParticle: remainingParticles)
            {
                if(firstParticle.isCollidingWith(secondParticle))
                {
                    collisions.add(new Collision(firstParticle, secondParticle));
                }
            }
        }
        return collisions;
    }

    public void show()
    {
        this.showShape();
        this.showParticles();
    }

    private void showShape()
    {
        this.setupShowShape();
        this.collisionShape.show();
    }

    private void setupShowShape()
    {
        color trensparentGrey = color(80, 80, 80, 60);
        fill(trensparentGrey);
        noStroke();
    }

    private void showParticles()
    {
        this.setupShowParticles();
        for(final Particle particle: this.particles)
        {
            particle.show();
        }
    }

    private void setupShowParticles()
    {
        color trensparentGrey = color(40, 40, 128);
        fill(trensparentGrey);
        noStroke();
    }
}
