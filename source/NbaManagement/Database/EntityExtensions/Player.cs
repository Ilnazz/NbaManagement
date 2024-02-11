using System.Linq;

namespace NbaManagement.Database
{
    public partial class Player
    {
        public string Name => $"{LastName} {FirstName}";

        public PlayerPosition FirstPosition => PlayerPosition.FirstOrDefault();

        public string FirstPositionShortName
        {
            get
            {
                if (FirstPosition is null)
                    return string.Empty;

                var positionName = FirstPosition.Name;
                return new string(positionName.Where(c => char.IsUpper(c)).ToArray());
            }
        }

        public bool IsSmallForward => IsPlayerHasPositionWithId(1);

        public bool IsPowerForward => IsPlayerHasPositionWithId(2);

        public bool IsCenter => IsPlayerHasPositionWithId(3);

        public bool IsShootingGuard => IsPlayerHasPositionWithId(4);

        public bool IsPointGuard => IsPlayerHasPositionWithId(5);

        public bool IsGoalkeeper => IsPlayerHasPositionWithId(6);

        private bool IsPlayerHasPositionWithId(int positionId) =>
            PlayerPosition.Any(playerPosition => playerPosition.Id == positionId);
    }
}