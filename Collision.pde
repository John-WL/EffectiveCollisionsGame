public final class Collision
{
    private final Particle firstParticle;
    private final Particle secondParticle;

    public Collision(final Particle firstParticle, final Particle secondParticle)
    {
        this.firstParticle = firstParticle;
        this.secondParticle = secondParticle;
    }

    public void updateParticlesProperties()
    {
        this.firstParticle.updatePropertiesOfThisAnd(this.secondParticle);
    }

    public void addParticlesTo(final Consumer<Particle> collisionEventConsumer)
    {
        collisionEventConsumer.accept(this.firstParticle);
        collisionEventConsumer.accept(this.secondParticle);
    }
}
