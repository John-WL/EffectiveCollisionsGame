final class Collision
{
    final Particle firstParticle;
    final Particle secondParticle;

    Collision(final Particle firstParticle, final Particle secondParticle)
    {
        this.firstParticle = firstParticle;
        this.secondParticle = secondParticle;
    }

    public void updateParticlesProperties()
    {
        this.firstParticle.updatePropertiesOfThisAnd(this.secondParticle);
    }

    public void addParticlesTo(final ParticleHandler particleHandler)
    {
        particleHandler.addParticle(this.firstParticle);
        particleHandler.addParticle(this.secondParticle);
    }
}
