final class EffectiveCollisions extends ProcessingApplication
{
    private final CollisionHandler collisionHandler;
    private final ParticleHandler particleHandler;

    public EffectiveCollisions()
    {
        final ParticleHandler particleHandler = new ParticleHandler();

        final Collection<CollisionArea> areas = new ArrayList<CollisionArea>();
        {
            final Set<Particle> particles = new HashSet<Particle>();
            {
                final Particle particle = new Particle(new Vector2(width/2, height/2), new Vector2(10, 10));
                particles.add(particle);
                particleHandler.addParticle(particle);
            }
            {
                final Particle particle = new Particle(new Vector2(width - 100, height - 50), new Vector2(0, 0));
                particles.add(particle);
                particleHandler.addParticle(particle);
            }
            final Circle visualArea = new Circle(new CircleData(new Vector2(width/2, height/2), 300));
            areas.add(new CollisionArea(particles, visualArea));
        }
        this.particleHandler = particleHandler;
        this.collisionHandler = new CollisionHandler(areas, particleHandler.onParticleCollision);
    }

    public void backend()
    {
        this.collisionHandler.updateCollisionAreas();
        this.collisionHandler.collideParticles();
        this.particleHandler.actualizeParticles();
    }
    
    public void frontend()
    {
        background(0);
        collisionHandler.showCollisionAreas();
    }
}
