using System;

namespace NbaManagement.Database
{
    public partial class Player
    {
        public PlayerPosition Position => PlayerPosition;

        public int Experience => DateTime.Now.Year - JoinYear.Year;
    }
}