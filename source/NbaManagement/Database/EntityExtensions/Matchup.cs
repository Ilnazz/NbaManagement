namespace NbaManagement.Database
{
    public partial class Matchup
    {
        public MatchupType Type => MatchupType;

        public MatchupStatu Status => MatchupStatu;

        public Team TeamAway => Team;

        public Team TeamHome => Team1;
    }
}