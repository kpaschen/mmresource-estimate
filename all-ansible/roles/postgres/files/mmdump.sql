--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audits; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.audits (
    id character varying(26) NOT NULL,
    createat bigint,
    userid character varying(26),
    action character varying(512),
    extrainfo character varying(1024),
    ipaddress character varying(64),
    sessionid character varying(26)
);


ALTER TABLE public.audits OWNER TO mattermost;

--
-- Name: bots; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.bots (
    userid character varying(26) NOT NULL,
    description character varying(1024),
    ownerid character varying(190),
    createat bigint,
    updateat bigint,
    deleteat bigint,
    lasticonupdate bigint
);


ALTER TABLE public.bots OWNER TO mattermost;

--
-- Name: channelmemberhistory; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.channelmemberhistory (
    channelid character varying(26) NOT NULL,
    userid character varying(26) NOT NULL,
    jointime bigint NOT NULL,
    leavetime bigint
);


ALTER TABLE public.channelmemberhistory OWNER TO mattermost;

--
-- Name: channelmembers; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.channelmembers (
    channelid character varying(26) NOT NULL,
    userid character varying(26) NOT NULL,
    roles character varying(256),
    lastviewedat bigint,
    msgcount bigint,
    mentioncount bigint,
    notifyprops jsonb,
    lastupdateat bigint,
    schemeuser boolean,
    schemeadmin boolean,
    schemeguest boolean,
    mentioncountroot bigint,
    msgcountroot bigint
);


ALTER TABLE public.channelmembers OWNER TO mattermost;

--
-- Name: channels; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.channels (
    id character varying(26) NOT NULL,
    createat bigint,
    updateat bigint,
    deleteat bigint,
    teamid character varying(26),
    type character varying(1),
    displayname character varying(64),
    name character varying(64),
    header character varying(1024),
    purpose character varying(250),
    lastpostat bigint,
    totalmsgcount bigint,
    extraupdateat bigint,
    creatorid character varying(26),
    schemeid character varying(26),
    groupconstrained boolean,
    shared boolean,
    totalmsgcountroot bigint,
    lastrootpostat bigint DEFAULT '0'::bigint
);


ALTER TABLE public.channels OWNER TO mattermost;

--
-- Name: clusterdiscovery; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.clusterdiscovery (
    id character varying(26) NOT NULL,
    type character varying(64),
    clustername character varying(64),
    hostname character varying(512),
    gossipport integer,
    port integer,
    createat bigint,
    lastpingat bigint
);


ALTER TABLE public.clusterdiscovery OWNER TO mattermost;

--
-- Name: commands; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.commands (
    id character varying(26) NOT NULL,
    token character varying(26),
    createat bigint,
    updateat bigint,
    deleteat bigint,
    creatorid character varying(26),
    teamid character varying(26),
    trigger character varying(128),
    method character varying(1),
    username character varying(64),
    iconurl character varying(1024),
    autocomplete boolean,
    autocompletedesc character varying(1024),
    autocompletehint character varying(1024),
    displayname character varying(64),
    description character varying(128),
    url character varying(1024),
    pluginid character varying(190)
);


ALTER TABLE public.commands OWNER TO mattermost;

--
-- Name: commandwebhooks; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.commandwebhooks (
    id character varying(26) NOT NULL,
    createat bigint,
    commandid character varying(26),
    userid character varying(26),
    channelid character varying(26),
    rootid character varying(26),
    usecount integer
);


ALTER TABLE public.commandwebhooks OWNER TO mattermost;

--
-- Name: compliances; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.compliances (
    id character varying(26) NOT NULL,
    createat bigint,
    userid character varying(26),
    status character varying(64),
    count integer,
    "desc" character varying(512),
    type character varying(64),
    startat bigint,
    endat bigint,
    keywords character varying(512),
    emails character varying(1024)
);


ALTER TABLE public.compliances OWNER TO mattermost;

--
-- Name: db_lock; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.db_lock (
    id character varying(64) NOT NULL,
    expireat bigint
);


ALTER TABLE public.db_lock OWNER TO mattermost;

--
-- Name: db_migrations; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.db_migrations (
    version bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.db_migrations OWNER TO mattermost;

--
-- Name: emoji; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.emoji (
    id character varying(26) NOT NULL,
    createat bigint,
    updateat bigint,
    deleteat bigint,
    creatorid character varying(26),
    name character varying(64)
);


ALTER TABLE public.emoji OWNER TO mattermost;

--
-- Name: fileinfo; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.fileinfo (
    id character varying(26) NOT NULL,
    creatorid character varying(26),
    postid character varying(26),
    createat bigint,
    updateat bigint,
    deleteat bigint,
    path character varying(512),
    thumbnailpath character varying(512),
    previewpath character varying(512),
    name character varying(256),
    extension character varying(64),
    size bigint,
    mimetype character varying(256),
    width integer,
    height integer,
    haspreviewimage boolean,
    minipreview bytea,
    content text,
    remoteid character varying(26),
    archived boolean DEFAULT false NOT NULL
);


ALTER TABLE public.fileinfo OWNER TO mattermost;

--
-- Name: focalboard_blocks; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_blocks (
    id character varying(36) NOT NULL,
    insert_at timestamp with time zone DEFAULT now() NOT NULL,
    parent_id character varying(36),
    schema bigint,
    type text,
    title text,
    fields json,
    create_at bigint,
    update_at bigint,
    delete_at bigint,
    root_id character varying(36),
    modified_by character varying(36) NOT NULL,
    workspace_id character varying(36) NOT NULL,
    created_by character varying(36) NOT NULL
);


ALTER TABLE public.focalboard_blocks OWNER TO mattermost;

--
-- Name: focalboard_blocks_history; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_blocks_history (
    id character varying(36) NOT NULL,
    insert_at timestamp with time zone DEFAULT now() NOT NULL,
    parent_id character varying(36),
    schema bigint,
    type text,
    title text,
    fields json,
    create_at bigint,
    update_at bigint,
    delete_at bigint,
    root_id character varying(36),
    modified_by character varying(36),
    workspace_id character varying(36),
    created_by character varying(36)
);


ALTER TABLE public.focalboard_blocks_history OWNER TO mattermost;

--
-- Name: focalboard_file_info; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_file_info (
    id character varying(26) NOT NULL,
    create_at bigint NOT NULL,
    delete_at bigint,
    name text NOT NULL,
    extension character varying(50) NOT NULL,
    size bigint NOT NULL,
    archived boolean
);


ALTER TABLE public.focalboard_file_info OWNER TO mattermost;

--
-- Name: focalboard_notification_hints; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_notification_hints (
    block_type character varying(10),
    block_id character varying(36) NOT NULL,
    workspace_id character varying(36),
    modified_by_id character varying(36),
    create_at bigint,
    notify_at bigint
);


ALTER TABLE public.focalboard_notification_hints OWNER TO mattermost;

--
-- Name: focalboard_schema_migrations; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE public.focalboard_schema_migrations OWNER TO mattermost;

--
-- Name: focalboard_sessions; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_sessions (
    id character varying(100) NOT NULL,
    token character varying(100),
    user_id character varying(100),
    props json,
    create_at bigint,
    update_at bigint,
    auth_service character varying(20)
);


ALTER TABLE public.focalboard_sessions OWNER TO mattermost;

--
-- Name: focalboard_sharing; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_sharing (
    id character varying(36) NOT NULL,
    enabled boolean,
    token character varying(100),
    modified_by character varying(36),
    update_at bigint,
    workspace_id character varying(36)
);


ALTER TABLE public.focalboard_sharing OWNER TO mattermost;

--
-- Name: focalboard_subscriptions; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_subscriptions (
    block_type character varying(10),
    block_id character varying(36) NOT NULL,
    workspace_id character varying(36),
    subscriber_type character varying(10),
    subscriber_id character varying(36) NOT NULL,
    notified_at bigint,
    create_at bigint,
    delete_at bigint
);


ALTER TABLE public.focalboard_subscriptions OWNER TO mattermost;

--
-- Name: focalboard_system_settings; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_system_settings (
    id character varying(100) NOT NULL,
    value text
);


ALTER TABLE public.focalboard_system_settings OWNER TO mattermost;

--
-- Name: focalboard_users; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_users (
    id character varying(100) NOT NULL,
    username character varying(100),
    email character varying(255),
    password character varying(100),
    mfa_secret character varying(100),
    auth_service character varying(20),
    auth_data character varying(255),
    props json,
    create_at bigint,
    update_at bigint,
    delete_at bigint
);


ALTER TABLE public.focalboard_users OWNER TO mattermost;

--
-- Name: focalboard_workspaces; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_workspaces (
    id character varying(36) NOT NULL,
    signup_token character varying(100) NOT NULL,
    settings json,
    modified_by character varying(36),
    update_at bigint
);


ALTER TABLE public.focalboard_workspaces OWNER TO mattermost;

--
-- Name: groupchannels; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.groupchannels (
    groupid character varying(26) NOT NULL,
    autoadd boolean,
    schemeadmin boolean,
    createat bigint,
    deleteat bigint,
    updateat bigint,
    channelid character varying(26) NOT NULL
);


ALTER TABLE public.groupchannels OWNER TO mattermost;

--
-- Name: groupmembers; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.groupmembers (
    groupid character varying(26) NOT NULL,
    userid character varying(26) NOT NULL,
    createat bigint,
    deleteat bigint
);


ALTER TABLE public.groupmembers OWNER TO mattermost;

--
-- Name: groupteams; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.groupteams (
    groupid character varying(26) NOT NULL,
    autoadd boolean,
    schemeadmin boolean,
    createat bigint,
    deleteat bigint,
    updateat bigint,
    teamid character varying(26) NOT NULL
);


ALTER TABLE public.groupteams OWNER TO mattermost;

--
-- Name: incomingwebhooks; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.incomingwebhooks (
    id character varying(26) NOT NULL,
    createat bigint,
    updateat bigint,
    deleteat bigint,
    userid character varying(26),
    channelid character varying(26),
    teamid character varying(26),
    displayname character varying(64),
    description character varying(500),
    username character varying(255),
    iconurl character varying(1024),
    channellocked boolean
);


ALTER TABLE public.incomingwebhooks OWNER TO mattermost;

--
-- Name: ir_channelaction; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_channelaction (
    id text NOT NULL,
    channelid character varying(26),
    enabled boolean DEFAULT false,
    deleteat bigint DEFAULT 0 NOT NULL,
    actiontype text NOT NULL,
    triggertype text NOT NULL,
    payload json NOT NULL
);


ALTER TABLE public.ir_channelaction OWNER TO mattermost;

--
-- Name: ir_db_migrations; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_db_migrations (
    version bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.ir_db_migrations OWNER TO mattermost;

--
-- Name: ir_incident; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_incident (
    id text NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    isactive boolean NOT NULL,
    commanderuserid text NOT NULL,
    teamid text NOT NULL,
    channelid text NOT NULL,
    createat bigint NOT NULL,
    endat bigint DEFAULT 0 NOT NULL,
    deleteat bigint DEFAULT 0 NOT NULL,
    activestage bigint NOT NULL,
    postid text DEFAULT ''::text NOT NULL,
    playbookid text DEFAULT ''::text NOT NULL,
    checklistsjson json NOT NULL,
    activestagetitle text DEFAULT ''::text,
    reminderpostid text,
    broadcastchannelid text DEFAULT ''::text,
    previousreminder bigint DEFAULT 0 NOT NULL,
    remindermessagetemplate text DEFAULT ''::text,
    currentstatus text DEFAULT 'Active'::text NOT NULL,
    reporteruserid text DEFAULT ''::text NOT NULL,
    concatenatedinviteduserids text DEFAULT ''::text,
    defaultcommanderid text DEFAULT ''::text,
    announcementchannelid text DEFAULT ''::text,
    concatenatedwebhookoncreationurls text DEFAULT ''::text,
    concatenatedinvitedgroupids text DEFAULT ''::text,
    retrospective text DEFAULT ''::text,
    messageonjoin text DEFAULT ''::text,
    retrospectivepublishedat bigint DEFAULT 0 NOT NULL,
    retrospectivereminderintervalseconds bigint DEFAULT 0 NOT NULL,
    retrospectivewascanceled boolean DEFAULT false,
    concatenatedwebhookonstatusupdateurls text DEFAULT ''::text,
    laststatusupdateat bigint DEFAULT 0,
    exportchannelonfinishedenabled boolean DEFAULT false NOT NULL,
    categorizechannelenabled boolean DEFAULT false,
    categoryname text DEFAULT ''::text,
    concatenatedbroadcastchannelids text,
    channelidtorootid text DEFAULT ''::text,
    remindertimerdefaultseconds bigint DEFAULT 0 NOT NULL,
    statusupdateenabled boolean DEFAULT true,
    retrospectiveenabled boolean DEFAULT true,
    statusupdatebroadcastchannelsenabled boolean DEFAULT false,
    statusupdatebroadcastwebhooksenabled boolean DEFAULT false
);


ALTER TABLE public.ir_incident OWNER TO mattermost;

--
-- Name: ir_metric; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_metric (
    incidentid text NOT NULL,
    metricconfigid text NOT NULL,
    value bigint,
    published boolean NOT NULL
);


ALTER TABLE public.ir_metric OWNER TO mattermost;

--
-- Name: ir_metricconfig; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_metricconfig (
    id text NOT NULL,
    playbookid text NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    type text NOT NULL,
    target bigint,
    ordering smallint DEFAULT 0 NOT NULL,
    deleteat bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.ir_metricconfig OWNER TO mattermost;

--
-- Name: ir_playbook; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_playbook (
    id text NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    teamid text NOT NULL,
    createpublicincident boolean NOT NULL,
    createat bigint NOT NULL,
    deleteat bigint DEFAULT 0 NOT NULL,
    checklistsjson json NOT NULL,
    numstages bigint DEFAULT 0 NOT NULL,
    numsteps bigint DEFAULT 0 NOT NULL,
    broadcastchannelid text DEFAULT ''::text,
    remindermessagetemplate text DEFAULT ''::text,
    remindertimerdefaultseconds bigint DEFAULT 0 NOT NULL,
    concatenatedinviteduserids text DEFAULT ''::text,
    inviteusersenabled boolean DEFAULT false,
    defaultcommanderid text DEFAULT ''::text,
    defaultcommanderenabled boolean DEFAULT false,
    announcementchannelid text DEFAULT ''::text,
    announcementchannelenabled boolean DEFAULT false,
    concatenatedwebhookoncreationurls text DEFAULT ''::text,
    webhookoncreationenabled boolean DEFAULT false,
    concatenatedinvitedgroupids text DEFAULT ''::text,
    messageonjoin text DEFAULT ''::text,
    messageonjoinenabled boolean DEFAULT false,
    retrospectivereminderintervalseconds bigint DEFAULT 0 NOT NULL,
    retrospectivetemplate text,
    concatenatedwebhookonstatusupdateurls text DEFAULT ''::text,
    webhookonstatusupdateenabled boolean DEFAULT false,
    concatenatedsignalanykeywords text DEFAULT ''::text,
    signalanykeywordsenabled boolean DEFAULT false,
    updateat bigint DEFAULT 0 NOT NULL,
    exportchannelonfinishedenabled boolean DEFAULT false NOT NULL,
    categorizechannelenabled boolean DEFAULT false,
    categoryname text DEFAULT ''::text,
    concatenatedbroadcastchannelids text,
    broadcastenabled boolean DEFAULT false,
    runsummarytemplate text DEFAULT ''::text,
    channelnametemplate text DEFAULT ''::text,
    statusupdateenabled boolean DEFAULT true,
    retrospectiveenabled boolean DEFAULT true,
    public boolean DEFAULT false,
    runsummarytemplateenabled boolean DEFAULT true
);


ALTER TABLE public.ir_playbook OWNER TO mattermost;

--
-- Name: ir_playbookautofollow; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_playbookautofollow (
    playbookid text NOT NULL,
    userid text NOT NULL
);


ALTER TABLE public.ir_playbookautofollow OWNER TO mattermost;

--
-- Name: ir_playbookmember; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_playbookmember (
    playbookid text NOT NULL,
    memberid text NOT NULL,
    roles text
);


ALTER TABLE public.ir_playbookmember OWNER TO mattermost;

--
-- Name: ir_run_participants; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_run_participants (
    userid text NOT NULL,
    incidentid text NOT NULL,
    isfollower boolean NOT NULL
);


ALTER TABLE public.ir_run_participants OWNER TO mattermost;

--
-- Name: ir_statusposts; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_statusposts (
    incidentid text NOT NULL,
    postid text NOT NULL
);


ALTER TABLE public.ir_statusposts OWNER TO mattermost;

--
-- Name: ir_system; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_system (
    skey character varying(64) NOT NULL,
    svalue character varying(1024)
);


ALTER TABLE public.ir_system OWNER TO mattermost;

--
-- Name: ir_timelineevent; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_timelineevent (
    id text NOT NULL,
    incidentid text NOT NULL,
    createat bigint NOT NULL,
    deleteat bigint DEFAULT 0 NOT NULL,
    eventat bigint NOT NULL,
    eventtype text DEFAULT ''::text NOT NULL,
    summary text DEFAULT ''::text NOT NULL,
    details text DEFAULT ''::text NOT NULL,
    postid text DEFAULT ''::text NOT NULL,
    subjectuserid text DEFAULT ''::text NOT NULL,
    creatoruserid text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.ir_timelineevent OWNER TO mattermost;

--
-- Name: ir_userinfo; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_userinfo (
    id text NOT NULL,
    lastdailytododmat bigint,
    digestnotificationsettingsjson json
);


ALTER TABLE public.ir_userinfo OWNER TO mattermost;

--
-- Name: ir_viewedchannel; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_viewedchannel (
    channelid text NOT NULL,
    userid text NOT NULL
);


ALTER TABLE public.ir_viewedchannel OWNER TO mattermost;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.jobs (
    id character varying(26) NOT NULL,
    type character varying(32),
    priority bigint,
    createat bigint,
    startat bigint,
    lastactivityat bigint,
    status character varying(32),
    progress bigint,
    data jsonb
);


ALTER TABLE public.jobs OWNER TO mattermost;

--
-- Name: licenses; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.licenses (
    id character varying(26) NOT NULL,
    createat bigint,
    bytes character varying(10000)
);


ALTER TABLE public.licenses OWNER TO mattermost;

--
-- Name: linkmetadata; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.linkmetadata (
    hash bigint NOT NULL,
    url character varying(2048),
    "timestamp" bigint,
    type character varying(16),
    data jsonb
);


ALTER TABLE public.linkmetadata OWNER TO mattermost;

--
-- Name: oauthaccessdata; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.oauthaccessdata (
    token character varying(26) NOT NULL,
    refreshtoken character varying(26),
    redirecturi character varying(256),
    clientid character varying(26),
    userid character varying(26),
    expiresat bigint,
    scope character varying(128)
);


ALTER TABLE public.oauthaccessdata OWNER TO mattermost;

--
-- Name: oauthapps; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.oauthapps (
    id character varying(26) NOT NULL,
    creatorid character varying(26),
    createat bigint,
    updateat bigint,
    clientsecret character varying(128),
    name character varying(64),
    description character varying(512),
    callbackurls character varying(1024),
    homepage character varying(256),
    istrusted boolean,
    iconurl character varying(512),
    mattermostappid character varying(32) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oauthapps OWNER TO mattermost;

--
-- Name: oauthauthdata; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.oauthauthdata (
    clientid character varying(26),
    userid character varying(26),
    code character varying(128) NOT NULL,
    expiresin integer,
    createat bigint,
    redirecturi character varying(256),
    state character varying(1024),
    scope character varying(128)
);


ALTER TABLE public.oauthauthdata OWNER TO mattermost;

--
-- Name: outgoingwebhooks; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.outgoingwebhooks (
    id character varying(26) NOT NULL,
    token character varying(26),
    createat bigint,
    updateat bigint,
    deleteat bigint,
    creatorid character varying(26),
    channelid character varying(26),
    teamid character varying(26),
    triggerwords character varying(1024),
    callbackurls character varying(1024),
    displayname character varying(64),
    contenttype character varying(128),
    triggerwhen integer,
    username character varying(64),
    iconurl character varying(1024),
    description character varying(500)
);


ALTER TABLE public.outgoingwebhooks OWNER TO mattermost;

--
-- Name: pluginkeyvaluestore; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.pluginkeyvaluestore (
    pluginid character varying(190) NOT NULL,
    pkey character varying(150) NOT NULL,
    pvalue bytea,
    expireat bigint
);


ALTER TABLE public.pluginkeyvaluestore OWNER TO mattermost;

--
-- Name: posts; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.posts (
    id character varying(26) NOT NULL,
    createat bigint,
    updateat bigint,
    deleteat bigint,
    userid character varying(26),
    channelid character varying(26),
    rootid character varying(26),
    originalid character varying(26),
    message character varying(65535),
    type character varying(26),
    props jsonb,
    hashtags character varying(1000),
    filenames character varying(4000),
    fileids character varying(300),
    hasreactions boolean,
    editat bigint,
    ispinned boolean,
    remoteid character varying(26)
);


ALTER TABLE public.posts OWNER TO mattermost;

--
-- Name: preferences; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.preferences (
    userid character varying(26) NOT NULL,
    category character varying(32) NOT NULL,
    name character varying(32) NOT NULL,
    value character varying(2000)
);


ALTER TABLE public.preferences OWNER TO mattermost;

--
-- Name: productnoticeviewstate; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.productnoticeviewstate (
    userid character varying(26) NOT NULL,
    noticeid character varying(26) NOT NULL,
    viewed integer,
    "timestamp" bigint
);


ALTER TABLE public.productnoticeviewstate OWNER TO mattermost;

--
-- Name: publicchannels; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.publicchannels (
    id character varying(26) NOT NULL,
    deleteat bigint,
    teamid character varying(26),
    displayname character varying(64),
    name character varying(64),
    header character varying(1024),
    purpose character varying(250)
);


ALTER TABLE public.publicchannels OWNER TO mattermost;

--
-- Name: reactions; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.reactions (
    userid character varying(26) NOT NULL,
    postid character varying(26) NOT NULL,
    emojiname character varying(64) NOT NULL,
    createat bigint,
    updateat bigint,
    deleteat bigint,
    remoteid character varying(26),
    channelid character varying(26) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.reactions OWNER TO mattermost;

--
-- Name: recentsearches; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.recentsearches (
    userid character(26) NOT NULL,
    searchpointer integer NOT NULL,
    query jsonb,
    createat bigint NOT NULL
);


ALTER TABLE public.recentsearches OWNER TO mattermost;

--
-- Name: remoteclusters; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.remoteclusters (
    remoteid character varying(26) NOT NULL,
    remoteteamid character varying(26),
    name character varying(64) NOT NULL,
    displayname character varying(64),
    siteurl character varying(512),
    createat bigint,
    lastpingat bigint,
    token character varying(26),
    remotetoken character varying(26),
    topics character varying(512),
    creatorid character varying(26)
);


ALTER TABLE public.remoteclusters OWNER TO mattermost;

--
-- Name: retentionpolicies; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.retentionpolicies (
    id character varying(26) NOT NULL,
    displayname character varying(64),
    postduration bigint
);


ALTER TABLE public.retentionpolicies OWNER TO mattermost;

--
-- Name: retentionpolicieschannels; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.retentionpolicieschannels (
    policyid character varying(26),
    channelid character varying(26) NOT NULL
);


ALTER TABLE public.retentionpolicieschannels OWNER TO mattermost;

--
-- Name: retentionpoliciesteams; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.retentionpoliciesteams (
    policyid character varying(26),
    teamid character varying(26) NOT NULL
);


ALTER TABLE public.retentionpoliciesteams OWNER TO mattermost;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.roles (
    id character varying(26) NOT NULL,
    name character varying(64),
    displayname character varying(128),
    description character varying(1024),
    createat bigint,
    updateat bigint,
    deleteat bigint,
    permissions text,
    schememanaged boolean,
    builtin boolean
);


ALTER TABLE public.roles OWNER TO mattermost;

--
-- Name: schemes; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.schemes (
    id character varying(26) NOT NULL,
    name character varying(64),
    displayname character varying(128),
    description character varying(1024),
    createat bigint,
    updateat bigint,
    deleteat bigint,
    scope character varying(32),
    defaultteamadminrole character varying(64),
    defaultteamuserrole character varying(64),
    defaultchanneladminrole character varying(64),
    defaultchanneluserrole character varying(64),
    defaultteamguestrole character varying(64),
    defaultchannelguestrole character varying(64),
    defaultplaybookadminrole character varying(64) DEFAULT ''::character varying,
    defaultplaybookmemberrole character varying(64) DEFAULT ''::character varying,
    defaultrunadminrole character varying(64) DEFAULT ''::character varying,
    defaultrunmemberrole character varying(64) DEFAULT ''::character varying
);


ALTER TABLE public.schemes OWNER TO mattermost;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.sessions (
    id character varying(26) NOT NULL,
    token character varying(26),
    createat bigint,
    expiresat bigint,
    lastactivityat bigint,
    userid character varying(26),
    deviceid character varying(512),
    roles character varying(256),
    isoauth boolean,
    props jsonb,
    expirednotify boolean
);


ALTER TABLE public.sessions OWNER TO mattermost;

--
-- Name: sharedchannelattachments; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.sharedchannelattachments (
    id character varying(26) NOT NULL,
    fileid character varying(26),
    remoteid character varying(26),
    createat bigint,
    lastsyncat bigint
);


ALTER TABLE public.sharedchannelattachments OWNER TO mattermost;

--
-- Name: sharedchannelremotes; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.sharedchannelremotes (
    id character varying(26) NOT NULL,
    channelid character varying(26) NOT NULL,
    creatorid character varying(26),
    createat bigint,
    updateat bigint,
    isinviteaccepted boolean,
    isinviteconfirmed boolean,
    remoteid character varying(26),
    lastpostupdateat bigint,
    lastpostid character varying(26)
);


ALTER TABLE public.sharedchannelremotes OWNER TO mattermost;

--
-- Name: sharedchannels; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.sharedchannels (
    channelid character varying(26) NOT NULL,
    teamid character varying(26),
    home boolean,
    readonly boolean,
    sharename character varying(64),
    sharedisplayname character varying(64),
    sharepurpose character varying(250),
    shareheader character varying(1024),
    creatorid character varying(26),
    createat bigint,
    updateat bigint,
    remoteid character varying(26)
);


ALTER TABLE public.sharedchannels OWNER TO mattermost;

--
-- Name: sharedchannelusers; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.sharedchannelusers (
    id character varying(26) NOT NULL,
    userid character varying(26),
    remoteid character varying(26),
    createat bigint,
    lastsyncat bigint,
    channelid character varying(26)
);


ALTER TABLE public.sharedchannelusers OWNER TO mattermost;

--
-- Name: sidebarcategories; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.sidebarcategories (
    id character varying(128) NOT NULL,
    userid character varying(26),
    teamid character varying(26),
    sortorder bigint,
    sorting character varying(64),
    type character varying(64),
    displayname character varying(64),
    muted boolean,
    collapsed boolean
);


ALTER TABLE public.sidebarcategories OWNER TO mattermost;

--
-- Name: sidebarchannels; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.sidebarchannels (
    channelid character varying(26) NOT NULL,
    userid character varying(26) NOT NULL,
    categoryid character varying(128) NOT NULL,
    sortorder bigint
);


ALTER TABLE public.sidebarchannels OWNER TO mattermost;

--
-- Name: status; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.status (
    userid character varying(26) NOT NULL,
    status character varying(32),
    manual boolean,
    lastactivityat bigint,
    dndendtime bigint,
    prevstatus character varying(32)
);


ALTER TABLE public.status OWNER TO mattermost;

--
-- Name: systems; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.systems (
    name character varying(64) NOT NULL,
    value character varying(1024)
);


ALTER TABLE public.systems OWNER TO mattermost;

--
-- Name: teammembers; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.teammembers (
    teamid character varying(26) NOT NULL,
    userid character varying(26) NOT NULL,
    roles character varying(256),
    deleteat bigint,
    schemeuser boolean,
    schemeadmin boolean,
    schemeguest boolean
);


ALTER TABLE public.teammembers OWNER TO mattermost;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.teams (
    id character varying(26) NOT NULL,
    createat bigint,
    updateat bigint,
    deleteat bigint,
    displayname character varying(64),
    name character varying(64),
    description character varying(255),
    email character varying(128),
    type character varying(255),
    companyname character varying(64),
    alloweddomains character varying(1000),
    inviteid character varying(32),
    schemeid character varying(26),
    allowopeninvite boolean,
    lastteamiconupdate bigint,
    groupconstrained boolean,
    cloudlimitsarchived boolean DEFAULT false NOT NULL
);


ALTER TABLE public.teams OWNER TO mattermost;

--
-- Name: termsofservice; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.termsofservice (
    id character varying(26) NOT NULL,
    createat bigint,
    userid character varying(26),
    text character varying(65535)
);


ALTER TABLE public.termsofservice OWNER TO mattermost;

--
-- Name: threadmemberships; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.threadmemberships (
    postid character varying(26) NOT NULL,
    userid character varying(26) NOT NULL,
    following boolean,
    lastviewed bigint,
    lastupdated bigint,
    unreadmentions bigint
);


ALTER TABLE public.threadmemberships OWNER TO mattermost;

--
-- Name: threads; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.threads (
    postid character varying(26) NOT NULL,
    replycount bigint,
    lastreplyat bigint,
    participants jsonb,
    channelid character varying(26),
    threaddeleteat bigint
);


ALTER TABLE public.threads OWNER TO mattermost;

--
-- Name: tokens; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.tokens (
    token character varying(64) NOT NULL,
    createat bigint,
    type character varying(64),
    extra character varying(2048)
);


ALTER TABLE public.tokens OWNER TO mattermost;

--
-- Name: uploadsessions; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.uploadsessions (
    id character varying(26) NOT NULL,
    type character varying(32),
    createat bigint,
    userid character varying(26),
    channelid character varying(26),
    filename character varying(256),
    path character varying(512),
    filesize bigint,
    fileoffset bigint,
    remoteid character varying(26),
    reqfileid character varying(26)
);


ALTER TABLE public.uploadsessions OWNER TO mattermost;

--
-- Name: useraccesstokens; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.useraccesstokens (
    id character varying(26) NOT NULL,
    token character varying(26),
    userid character varying(26),
    description character varying(512),
    isactive boolean
);


ALTER TABLE public.useraccesstokens OWNER TO mattermost;

--
-- Name: usergroups; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.usergroups (
    id character varying(26) NOT NULL,
    name character varying(64),
    displayname character varying(128),
    description character varying(1024),
    source character varying(64),
    remoteid character varying(48),
    createat bigint,
    updateat bigint,
    deleteat bigint,
    allowreference boolean
);


ALTER TABLE public.usergroups OWNER TO mattermost;

--
-- Name: users; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.users (
    id character varying(26) NOT NULL,
    createat bigint,
    updateat bigint,
    deleteat bigint,
    username character varying(64),
    password character varying(128),
    authdata character varying(128),
    authservice character varying(32),
    email character varying(128),
    emailverified boolean,
    nickname character varying(64),
    firstname character varying(64),
    lastname character varying(64),
    roles character varying(256),
    allowmarketing boolean,
    props jsonb,
    notifyprops jsonb,
    lastpasswordupdate bigint,
    lastpictureupdate bigint,
    failedattempts integer,
    locale character varying(5),
    mfaactive boolean,
    mfasecret character varying(128),
    "position" character varying(128),
    timezone jsonb,
    remoteid character varying(26)
);


ALTER TABLE public.users OWNER TO mattermost;

--
-- Name: usertermsofservice; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.usertermsofservice (
    userid character varying(26) NOT NULL,
    termsofserviceid character varying(26),
    createat bigint
);


ALTER TABLE public.usertermsofservice OWNER TO mattermost;

--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.audits (id, createat, userid, action, extrainfo, ipaddress, sessionid) FROM stdin;
5cj5ip5bw7nrzd71815a7cii9w	1665489773491	m4tc9zbumffgd8taws1x5mts6w	/api/v4/users/login	attempt - login_id=	127.0.0.1	
8h3z4esgminmtpuadobc8xyy9y	1665489773591	m4tc9zbumffgd8taws1x5mts6w	/api/v4/users/login	authenticated	127.0.0.1	
xhh9ecsycfdstnpwe8hhcdjrnc	1665489773611	m4tc9zbumffgd8taws1x5mts6w	/api/v4/users/login	success session_user=m4tc9zbumffgd8taws1x5mts6w	127.0.0.1	u4bg7buy3j8f3p641gj7nmombo
fycnyyst4iyqxfba3fc6t3ztme	1665489774002	m4tc9zbumffgd8taws1x5mts6w	/api/v4/users/me/patch		127.0.0.1	u4bg7buy3j8f3p641gj7nmombo
8as9djfy1pr7dbtx1gzx6fqcdo	1665489850561	m4tc9zbumffgd8taws1x5mts6w	/api/v4/config	updateConfig	127.0.0.1	u4bg7buy3j8f3p641gj7nmombo
crqbixfn67n3pjs1bhtwir9z8h	1665489939507	m4tc9zbumffgd8taws1x5mts6w	/api/v4/config	updateConfig	127.0.0.1	u4bg7buy3j8f3p641gj7nmombo
m9a3og9m3jfxtkan573xzoix4y	1665492794025	m4tc9zbumffgd8taws1x5mts6w	/api/v4/config	updateConfig	127.0.0.1	u4bg7buy3j8f3p641gj7nmombo
\.


--
-- Data for Name: bots; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.bots (userid, description, ownerid, createat, updateat, deleteat, lasticonupdate) FROM stdin;
7g6bqj1cyjbr9gtb3jecpr6ryw	A bot account created by the channel export plugin.	com.mattermost.plugin-channel-export	1665484111061	1665484111061	0	0
ezfs69k173nau8egif17mpa65w	Feedbackbot collects user feedback to improve Mattermost. [Learn more](https://mattermost.com/pl/default-nps).	com.mattermost.nps	1665484111297	1665484111297	0	0
d63gdnet4pyn8cqfcjgepf1c9c	Mattermost Apps Registry and API proxy.	com.mattermost.apps	1665484113274	1665484113274	0	0
jxed9w7hr3ddzrkc1hm8g7yrie	Playbooks bot.	playbooks	1665484114795	1665484114795	0	0
o8urxe361pyninrsxstzg4jddc	Created by Boards plugin.	focalboard	1665484115631	1665484115631	0	0
\.


--
-- Data for Name: channelmemberhistory; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.channelmemberhistory (channelid, userid, jointime, leavetime) FROM stdin;
iz1mrkk4c7nttrssz3etgsfi7y	m4tc9zbumffgd8taws1x5mts6w	1665489781326	\N
8iipdskgt3rbfc96nat18k36er	m4tc9zbumffgd8taws1x5mts6w	1665489781378	\N
\.


--
-- Data for Name: channelmembers; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.channelmembers (channelid, userid, roles, lastviewedat, msgcount, mentioncount, notifyprops, lastupdateat, schemeuser, schemeadmin, schemeguest, mentioncountroot, msgcountroot) FROM stdin;
8iipdskgt3rbfc96nat18k36er	m4tc9zbumffgd8taws1x5mts6w		0	0	0	{"push": "default", "email": "default", "desktop": "default", "mark_unread": "all", "ignore_channel_mentions": "default"}	1665489781367	t	t	f	0	0
iz1mrkk4c7nttrssz3etgsfi7y	m4tc9zbumffgd8taws1x5mts6w		1665489781334	0	0	{"push": "default", "email": "default", "desktop": "default", "mark_unread": "all", "ignore_channel_mentions": "default"}	1665489781334	t	t	f	0	0
\.


--
-- Data for Name: channels; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.channels (id, createat, updateat, deleteat, teamid, type, displayname, name, header, purpose, lastpostat, totalmsgcount, extraupdateat, creatorid, schemeid, groupconstrained, shared, totalmsgcountroot, lastrootpostat) FROM stdin;
iz1mrkk4c7nttrssz3etgsfi7y	1665489781252	1665489781252	0	8b5ukqi7mprkiettfopbbntphr	O	Town Square	town-square			1665489781334	0	0		\N	\N	\N	0	1665489781334
8iipdskgt3rbfc96nat18k36er	1665489781269	1665489781269	0	8b5ukqi7mprkiettfopbbntphr	O	Off-Topic	off-topic			1665489781381	0	0		\N	\N	\N	0	1665489781381
\.


--
-- Data for Name: clusterdiscovery; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.clusterdiscovery (id, type, clustername, hostname, gossipport, port, createat, lastpingat) FROM stdin;
\.


--
-- Data for Name: commands; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.commands (id, token, createat, updateat, deleteat, creatorid, teamid, trigger, method, username, iconurl, autocomplete, autocompletedesc, autocompletehint, displayname, description, url, pluginid) FROM stdin;
\.


--
-- Data for Name: commandwebhooks; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.commandwebhooks (id, createat, commandid, userid, channelid, rootid, usecount) FROM stdin;
\.


--
-- Data for Name: compliances; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.compliances (id, createat, userid, status, count, "desc", type, startat, endat, keywords, emails) FROM stdin;
\.


--
-- Data for Name: db_lock; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.db_lock (id, expireat) FROM stdin;
\.


--
-- Data for Name: db_migrations; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.db_migrations (version, name) FROM stdin;
1	create_teams
2	create_team_members
3	create_cluster_discovery
4	create_command_webhooks
5	create_compliances
6	create_emojis
7	create_user_groups
8	create_group_members
9	create_group_teams
10	create_group_channels
11	create_link_metadata
12	create_commands
13	create_incoming_webhooks
14	create_outgoing_webhooks
15	create_systems
16	create_reactions
17	create_roles
18	create_schemes
19	create_licenses
20	create_posts
21	create_product_notice_view_state
22	create_sessions
23	create_terms_of_service
24	create_audits
25	create_oauth_access_data
26	create_preferences
27	create_status
28	create_tokens
29	create_bots
30	create_user_access_tokens
31	create_remote_clusters
32	create_sharedchannels
33	create_sidebar_channels
34	create_oauthauthdata
35	create_sharedchannelattachments
36	create_sharedchannelusers
37	create_sharedchannelremotes
38	create_jobs
39	create_channel_member_history
40	create_sidebar_categories
41	create_upload_sessions
42	create_threads
43	thread_memberships
44	create_user_terms_of_service
45	create_plugin_key_value_store
46	create_users
47	create_file_info
48	create_oauth_apps
49	create_channels
50	create_channelmembers
51	create_msg_root_count
52	create_public_channels
53	create_retention_policies
54	create_crt_channelmembership_count
55	create_crt_thread_count_and_unreads
56	upgrade_channels_v6.0
57	upgrade_command_webhooks_v6.0
58	upgrade_channelmembers_v6.0
59	upgrade_users_v6.0
60	upgrade_jobs_v6.0
61	upgrade_link_metadata_v6.0
62	upgrade_sessions_v6.0
63	upgrade_threads_v6.0
64	upgrade_status_v6.0
65	upgrade_groupchannels_v6.0
66	upgrade_posts_v6.0
67	upgrade_channelmembers_v6.1
68	upgrade_teammembers_v6.1
69	upgrade_jobs_v6.1
70	upgrade_cte_v6.1
71	upgrade_sessions_v6.1
72	upgrade_schemes_v6.3
73	upgrade_plugin_key_value_store_v6.3
74	upgrade_users_v6.3
75	alter_upload_sessions_index
76	upgrade_lastrootpostat
77	upgrade_users_v6.5
78	create_oauth_mattermost_app_id
79	usergroups_displayname_index
80	posts_createat_id
81	threads_deleteat
82	upgrade_oauth_mattermost_app_id
83	threads_threaddeleteat
84	recent_searches
85	fileinfo_add_archived_column
86	add_cloud_limits_archived
87	sidebar_categories_index
88	remaining_migrations
89	add-channelid-to-reaction
\.


--
-- Data for Name: emoji; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.emoji (id, createat, updateat, deleteat, creatorid, name) FROM stdin;
\.


--
-- Data for Name: fileinfo; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.fileinfo (id, creatorid, postid, createat, updateat, deleteat, path, thumbnailpath, previewpath, name, extension, size, mimetype, width, height, haspreviewimage, minipreview, content, remoteid, archived) FROM stdin;
\.


--
-- Data for Name: focalboard_blocks; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_blocks (id, insert_at, parent_id, schema, type, title, fields, create_at, update_at, delete_at, root_id, modified_by, workspace_id, created_by) FROM stdin;
bm97xx5er7bfbjkfoh7m34i9d5e	2022-10-11 10:28:35.649711+00		1	board	Meeting Agenda 	{"cardProperties":[{"id":"d777ba3b-8728-40d1-87a6-59406bbbbfb0","name":"Status","options":[{"color":"propColorPink","id":"34eb9c25-d5bf-49d9-859e-f74f4e0030e7","value":"To Discuss 💬"},{"color":"propColorYellow","id":"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed","value":"Revisit Later ⏳"},{"color":"propColorGreen","id":"dabadd9b-adf1-4d9f-8702-805ac6cef602","value":"Done / Archived 📦"}],"type":"select"},{"id":"4cf1568d-530f-4028-8ffd-bdc65249187e","name":"Priority","options":[{"color":"propColorRed","id":"8b05c83e-a44a-4d04-831e-97f01d8e2003","value":"1. High"},{"color":"propColorYellow","id":"b1abafbf-a038-4a19-8b68-56e0fd2319f7","value":"2. Medium"},{"color":"propColorGray","id":"2491ffaa-eb55-417b-8aff-4bd7d4136613","value":"3. Low"}],"type":"select"},{"id":"aw4w63xhet79y9gueqzzeiifdoe","name":"Created by","options":[],"type":"createdBy"},{"id":"a6ux19353xcwfqg9k1inqg5sg4w","name":"Created time","options":[],"type":"createdTime"}],"description":"Use this template for recurring meeting agendas, like team meetings and 1:1's. To use this board:\\n* Participants queue new items to discuss under \\"To Discuss\\"\\n* Go through items during the meeting\\n* Move items to Done or Revisit Later as needed","icon":"🍩","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"54fcf9c610f0ac5e4c522c0657c90602"}	1665484115652	1665484115652	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
cq4rrd88wuj8zz8ya97nikruyth	2022-10-11 10:28:35.661998+00	bm97xx5er7bfbjkfoh7m34i9d5e	1	card	Team Schedule	{"contentOrder":["awntr8r8tb3y5u8xt4ooekpf4kr","78bizssm163bcxk7d8a5c1zmfoy","ax5d1oi94wirjjcbx5q3edm7zna","7yo3xsok4w7dhdxog9q9xsbwrsc","75axfqqjt1tnh9noek3sbnpf3hw","78a79ed3fqi8y3bkfxy798xbhpy"],"icon":"⏰","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"8b05c83e-a44a-4d04-831e-97f01d8e2003","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"34eb9c25-d5bf-49d9-859e-f74f4e0030e7"}}	1665484115665	1665484115664	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
ckbkffq8u6bd8uqpnfds3nx9zcw	2022-10-11 10:28:35.669744+00	bm97xx5er7bfbjkfoh7m34i9d5e	1	card	Video production	{"contentOrder":["aiic17pgx1bn7jkb6rp8qgj9yee","7m1a1g8tbm7gd5phdq1g71mjyac","aywutqt85hife8ks8uo5u7c41ar","78qd6sohre7n43dfo7h1ezy1suw","7xu9m347rppfzzd871s6uzgkpye","79mkdd7o3y3yhxkho9e51pgfpsw"],"icon":"📹","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"b1abafbf-a038-4a19-8b68-56e0fd2319f7","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"34eb9c25-d5bf-49d9-859e-f74f4e0030e7"}}	1665484115672	1665484115672	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
cgesjsttm63nypk4dhjawo78hke	2022-10-11 10:28:35.676958+00	bm97xx5er7bfbjkfoh7m34i9d5e	1	card	Offsite plans	{"contentOrder":["ayb7dzwjpofdbzf9r8igj4ngc4o","7pn9epcr1zfyp9gp1smmaks6cxr","a17azcxm3ctybpfjnpswne7mjow","7zunhku5nh3gspggwp83sbrgsfo","7izxeysn1i3djf8ob5ohn1nmzhc","7ozdc8muaq3gwjjkum6dg1p637a"],"icon":"🚙","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"8b05c83e-a44a-4d04-831e-97f01d8e2003","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"dabadd9b-adf1-4d9f-8702-805ac6cef602"}}	1665484115679	1665484115679	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
cr76dgiqek3f37btmgnxuu3wc1a	2022-10-11 10:28:35.683856+00	bm97xx5er7bfbjkfoh7m34i9d5e	1	card	Social Media Strategy	{"contentOrder":["auzp99fzqqjdg7r6dybdqdy4psc","7p5yz4gm4m7gi3khuspukez7mie","akudz7j3h43yn3gmtatd149sd3o","7ghj8qw39x78jxq6kjua4f6oxjw","7ndqtnco67tfybgcq998ioqqrmh","7cpzeu5rjip8e8xtydgjfkrexre"],"icon":"🎉","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"b1abafbf-a038-4a19-8b68-56e0fd2319f7","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed"}}	1665484115686	1665484115686	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
v4i1ygjyx3bgjxq5astyymd13za	2022-10-11 10:28:35.691105+00	bm97xx5er7bfbjkfoh7m34i9d5e	1	view	Discussion Items	{"cardOrder":["cjpkiya33qsagr4f9hrdwhgiajc"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"ch798q5ucefyobf5bymgqjt4f3h","filter":{"filters":[],"operation":"and"},"groupById":"d777ba3b-8728-40d1-87a6-59406bbbbfb0","hiddenOptionIds":[""],"kanbanCalculations":{},"sortOptions":[{"propertyId":"4cf1568d-530f-4028-8ffd-bdc65249187e","reversed":false}],"viewType":"board","visibleOptionIds":[],"visiblePropertyIds":["4cf1568d-530f-4028-8ffd-bdc65249187e"]}	1665484115693	1665484115693	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
75axfqqjt1tnh9noek3sbnpf3hw	2022-10-11 10:28:35.698457+00	cq4rrd88wuj8zz8ya97nikruyth	1	checkbox		{"value":false}	1665484115701	1665484115701	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7yo3xsok4w7dhdxog9q9xsbwrsc	2022-10-11 10:28:35.706254+00	cq4rrd88wuj8zz8ya97nikruyth	1	checkbox		{"value":false}	1665484115710	1665484115710	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
78bizssm163bcxk7d8a5c1zmfoy	2022-10-11 10:28:35.715552+00	cq4rrd88wuj8zz8ya97nikruyth	1	divider		{}	1665484115717	1665484115717	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
78a79ed3fqi8y3bkfxy798xbhpy	2022-10-11 10:28:35.722426+00	cq4rrd88wuj8zz8ya97nikruyth	1	checkbox		{"value":false}	1665484115724	1665484115724	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
awntr8r8tb3y5u8xt4ooekpf4kr	2022-10-11 10:28:35.729231+00	cq4rrd88wuj8zz8ya97nikruyth	1	text	## Notes\n*[Add meeting notes here]*	{}	1665484115731	1665484115731	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
ax5d1oi94wirjjcbx5q3edm7zna	2022-10-11 10:28:35.73645+00	cq4rrd88wuj8zz8ya97nikruyth	1	text	## Action Items	{}	1665484115739	1665484115739	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
74umemi8b37yibmbeyuo6mikj4w	2022-10-11 10:28:35.744404+00	ch798q5ucefyobf5bymgqjt4f3h	1	divider		{}	1665484115746	1665484115746	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
76fq4fuycnfycpyx6szdkwukjsr	2022-10-11 10:28:35.751486+00	ch798q5ucefyobf5bymgqjt4f3h	1	checkbox		{"value":false}	1665484115753	1665484115753	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7fows8dsk5jbt5q8qfa6q9qzhir	2022-10-11 10:28:35.758449+00	ch798q5ucefyobf5bymgqjt4f3h	1	checkbox		{"value":false}	1665484115760	1665484115760	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7qomzu99srpgidnpo6at6kdex8e	2022-10-11 10:28:35.76558+00	ch798q5ucefyobf5bymgqjt4f3h	1	checkbox		{"value":false}	1665484115768	1665484115768	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
au9rubtno7f8bzjb78wkr5uyy7r	2022-10-11 10:28:35.77279+00	ch798q5ucefyobf5bymgqjt4f3h	1	text	# Action Items	{}	1665484115775	1665484115775	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
a87ro89f633gtzngxs66xjrysar	2022-10-11 10:28:35.780048+00	ch798q5ucefyobf5bymgqjt4f3h	1	text	# Notes\n*[Add meeting notes here]*	{}	1665484115782	1665484115782	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7m1a1g8tbm7gd5phdq1g71mjyac	2022-10-11 10:28:35.786988+00	ckbkffq8u6bd8uqpnfds3nx9zcw	1	divider		{}	1665484115789	1665484115789	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
79mkdd7o3y3yhxkho9e51pgfpsw	2022-10-11 10:28:35.794272+00	ckbkffq8u6bd8uqpnfds3nx9zcw	1	checkbox		{"value":false}	1665484115796	1665484115796	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7xu9m347rppfzzd871s6uzgkpye	2022-10-11 10:28:35.801281+00	ckbkffq8u6bd8uqpnfds3nx9zcw	1	checkbox		{"value":false}	1665484115803	1665484115803	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
78qd6sohre7n43dfo7h1ezy1suw	2022-10-11 10:28:35.808483+00	ckbkffq8u6bd8uqpnfds3nx9zcw	1	checkbox		{"value":false}	1665484115810	1665484115810	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
aywutqt85hife8ks8uo5u7c41ar	2022-10-11 10:28:35.816403+00	ckbkffq8u6bd8uqpnfds3nx9zcw	1	text	## Action Items	{}	1665484115818	1665484115818	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7zunhku5nh3gspggwp83sbrgsfo	2022-10-11 10:28:35.832198+00	cgesjsttm63nypk4dhjawo78hke	1	checkbox		{"value":false}	1665484115835	1665484115835	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7pn9epcr1zfyp9gp1smmaks6cxr	2022-10-11 10:28:35.846969+00	cgesjsttm63nypk4dhjawo78hke	1	divider		{}	1665484115849	1665484115849	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
a17azcxm3ctybpfjnpswne7mjow	2022-10-11 10:28:35.861185+00	cgesjsttm63nypk4dhjawo78hke	1	text	## Action Items	{}	1665484115863	1665484115863	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7p5yz4gm4m7gi3khuspukez7mie	2022-10-11 10:28:35.875911+00	cr76dgiqek3f37btmgnxuu3wc1a	1	divider		{}	1665484115878	1665484115878	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7cpzeu5rjip8e8xtydgjfkrexre	2022-10-11 10:28:35.890727+00	cr76dgiqek3f37btmgnxuu3wc1a	1	checkbox		{"value":false}	1665484115893	1665484115893	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
akudz7j3h43yn3gmtatd149sd3o	2022-10-11 10:28:35.904647+00	cr76dgiqek3f37btmgnxuu3wc1a	1	text	## Action Items	{}	1665484115906	1665484115906	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
bwqu47azc7prgxqayntpkjz9zse	2022-10-11 10:28:35.919313+00		1	board	Personal Tasks 	{"cardProperties":[{"id":"a9zf59u8x1rf4ywctpcqama7tio","name":"Occurrence","options":[{"color":"propColorBlue","id":"an51dnkenmoog9cetapbc4uyt3y","value":"Daily"},{"color":"propColorOrange","id":"afpy8s7i45frggprmfsqngsocqh","value":"Weekly"},{"color":"propColorPurple","id":"aj4jyekqqssatjcq7r7chmy19ey","value":"Monthly"}],"type":"select"},{"id":"abthng7baedhhtrwsdodeuincqy","name":"Completed","options":[],"type":"checkbox"}],"description":"Use this template to organize your life and track your personal tasks.","icon":"✔️","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"dfb70c146a4584b8a21837477c7b5431"}	1665484115921	1665484115921	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
csd55okshm7ftz8ju6nfb7f8pzo	2022-10-11 10:28:35.93254+00	bwqu47azc7prgxqayntpkjz9zse	1	card	Buy groceries	{"contentOrder":["at7o5i6a6eif8jyu46eji79htxo","7iezc4bhu7bg79nsjp4wq7m46qo","78r6qeb3nyjyz8rpn1u7cf48znh","7fqih5dhi83yspmbwi5ptufu3gw","78ayeymwqk3bmtnmqgoedgptgue","78a4ka9zhrfd9dykaqh4uqxynda","7e4qi6tioht859ccdykbnf3ytgr"],"icon":"🛒","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"afpy8s7i45frggprmfsqngsocqh"}}	1665484115934	1665484115934	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
ctr989gtk6typ8ezgzw7qkqoapw	2022-10-11 10:28:35.946843+00	bwqu47azc7prgxqayntpkjz9zse	1	card	Feed Fluffy	{"contentOrder":["abwz6he7bipy93ye9oqqutyjp1c"],"icon":"🐱","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"an51dnkenmoog9cetapbc4uyt3y"}}	1665484115949	1665484115949	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
vhsizpegix3fepnr4guby19h3qy	2022-10-11 10:28:35.962778+00	bwqu47azc7prgxqayntpkjz9zse	1	view	List View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"__title":280},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["a9zf59u8x1rf4ywctpcqama7tio","abthng7baedhhtrwsdodeuincqy"]}	1665484115965	1665484115965	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
7mfzzaeo5ipdamjmwnstddprsgy	2022-10-11 10:28:35.977234+00	c3s6yggmhkid8zyoxfun16ihfqy	1	checkbox	Utilities	{"value":true}	1665484115979	1665484115979	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
7parwz89rfty7me8be3s99jft7e	2022-10-11 10:28:35.992764+00	c3s6yggmhkid8zyoxfun16ihfqy	1	checkbox	Internet	{"value":true}	1665484115995	1665484115995	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
78ayeymwqk3bmtnmqgoedgptgue	2022-10-11 10:28:36.008079+00	csd55okshm7ftz8ju6nfb7f8pzo	1	checkbox	Butter	{"value":false}	1665484116010	1665484116010	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
7iezc4bhu7bg79nsjp4wq7m46qo	2022-10-11 10:28:36.022595+00	csd55okshm7ftz8ju6nfb7f8pzo	1	checkbox	Milk	{"value":false}	1665484116024	1665484116024	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
78r6qeb3nyjyz8rpn1u7cf48znh	2022-10-11 10:28:36.036787+00	csd55okshm7ftz8ju6nfb7f8pzo	1	checkbox	Eggs	{"value":false}	1665484116039	1665484116039	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
757pb6aqqi7gxbcr1n6nxehkg8w	2022-10-11 10:28:36.051313+00	ccbp74hwobfbd8yzi96peb3ngho	1	image		{"fileId":"76fwrj36hptg6dywka4k5mt3sph.png"}	1665484116053	1665484116053	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
aijsaob9cifyg9rqm1pu5a7wqah	2022-10-11 10:28:36.065639+00	ccbp74hwobfbd8yzi96peb3ngho	1	text	## Route	{}	1665484116068	1665484116068	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
b6cuu7ogc4pyeijcxh3anappg6y	2022-10-11 10:28:36.189186+00		1	board	Project Tasks 	{"cardProperties":[{"id":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","name":"Status","options":[{"color":"propColorBlue","id":"ayz81h9f3dwp7rzzbdebesc7ute","value":"Not Started"},{"color":"propColorYellow","id":"ar6b8m3jxr3asyxhr8iucdbo6yc","value":"In Progress"},{"color":"propColorRed","id":"afi4o5nhnqc3smtzs1hs3ij34dh","value":"Blocked"},{"color":"propColorGreen","id":"adeo5xuwne3qjue83fcozekz8ko","value":"Completed 🙌"},{"color":"propColorBrown","id":"ahpyxfnnrzynsw3im1psxpkgtpe","value":"Archived"}],"type":"select"},{"id":"d3d682bf-e074-49d9-8df5-7320921c2d23","name":"Priority","options":[{"color":"propColorRed","id":"d3bfb50f-f569-4bad-8a3a-dd15c3f60101","value":"1. High 🔥"},{"color":"propColorYellow","id":"87f59784-b859-4c24-8ebe-17c766e081dd","value":"2. Medium"},{"color":"propColorGray","id":"98a57627-0f76-471d-850d-91f3ed9fd213","value":"3. Low"}],"type":"select"},{"id":"axkhqa4jxr3jcqe4k87g8bhmary","name":"Assignee","options":[],"type":"person"},{"id":"a8daz81s4xjgke1ww6cwik5w7ye","name":"Estimated Hours","options":[],"type":"number"},{"id":"a3zsw7xs8sxy7atj8b6totp3mby","name":"Due Date","options":[],"type":"date"},{"id":"a7gdnz8ff8iyuqmzddjgmgo9ery","name":"Created By","options":[],"type":"createdBy"},{"id":"2a5da320-735c-4093-8787-f56e15cdfeed","name":"Date Created","options":[],"type":"createdTime"}],"description":"Use this template to stay on top of your project tasks and progress.","icon":"🎯","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"a4ec399ab4f2088b1051c3cdf1dde4c3"}	1665484116191	1665484116191	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
c6k1gzxcgjffg9pwoedi81pxgpo	2022-10-11 10:28:36.205268+00	b6cuu7ogc4pyeijcxh3anappg6y	1	card	Define project scope	{"contentOrder":["an79yua3fujfspjhgh898kbcyea","7zqpu5mw7ojn77e1txcm5313iho","ab6qh1ypdtbfsuenf33nzamg8zh","7gx789wt1ptgs9n9zqicwfys8xw","7up99ooneatfemqztr3ppz6c65a","7k85ozpk7qjy6mccicb9kuibw6r","7y5sm9gjd3jgbtx5qcueqmfhy9a"],"icon":"🔬","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"32","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ar6b8m3jxr3asyxhr8iucdbo6yc","d3d682bf-e074-49d9-8df5-7320921c2d23":"87f59784-b859-4c24-8ebe-17c766e081dd"}}	1665484116208	1665484116207	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
a5yqeyxuxypg97g85uo5ttq176e	2022-10-11 10:28:36.96301+00	cmtnbp3xc7ibzfbr34wcz9yzxcc	1	text	## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...	{}	1665484116965	1665484116965	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
aiic17pgx1bn7jkb6rp8qgj9yee	2022-10-11 10:28:35.824541+00	ckbkffq8u6bd8uqpnfds3nx9zcw	1	text	## Notes\n*[Add meeting notes here]*	{}	1665484115827	1665484115827	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7izxeysn1i3djf8ob5ohn1nmzhc	2022-10-11 10:28:35.840104+00	cgesjsttm63nypk4dhjawo78hke	1	checkbox		{"value":false}	1665484115842	1665484115842	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7ozdc8muaq3gwjjkum6dg1p637a	2022-10-11 10:28:35.854132+00	cgesjsttm63nypk4dhjawo78hke	1	checkbox		{"value":false}	1665484115856	1665484115856	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
ayb7dzwjpofdbzf9r8igj4ngc4o	2022-10-11 10:28:35.868637+00	cgesjsttm63nypk4dhjawo78hke	1	text	## Notes\n*[Add meeting notes here]*	{}	1665484115871	1665484115871	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7ndqtnco67tfybgcq998ioqqrmh	2022-10-11 10:28:35.883198+00	cr76dgiqek3f37btmgnxuu3wc1a	1	checkbox		{"value":false}	1665484115885	1665484115885	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7ghj8qw39x78jxq6kjua4f6oxjw	2022-10-11 10:28:35.89759+00	cr76dgiqek3f37btmgnxuu3wc1a	1	checkbox		{"value":false}	1665484115899	1665484115899	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
auzp99fzqqjdg7r6dybdqdy4psc	2022-10-11 10:28:35.911561+00	cr76dgiqek3f37btmgnxuu3wc1a	1	text	## Notes\n*[Add meeting notes here]*	{}	1665484115913	1665484115913	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
c3s6yggmhkid8zyoxfun16ihfqy	2022-10-11 10:28:35.925904+00	bwqu47azc7prgxqayntpkjz9zse	1	card	Pay bills	{"contentOrder":["7d6c9u7hgmjr7ikhms4fpegjbcy","7parwz89rfty7me8be3s99jft7e","7mfzzaeo5ipdamjmwnstddprsgy"],"icon":"🔌","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"aj4jyekqqssatjcq7r7chmy19ey","abthng7baedhhtrwsdodeuincqy":"true"}}	1665484115928	1665484115928	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
ccbp74hwobfbd8yzi96peb3ngho	2022-10-11 10:28:35.939086+00	bwqu47azc7prgxqayntpkjz9zse	1	card	Go for a walk	{"contentOrder":["arjebudzzuf8e7dnmh6xf6mjxqo","aijsaob9cifyg9rqm1pu5a7wqah","757pb6aqqi7gxbcr1n6nxehkg8w"],"icon":"👣","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"an51dnkenmoog9cetapbc4uyt3y"}}	1665484115941	1665484115941	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
ccextuyz5dbd8tx3mkpknw9j1xw	2022-10-11 10:28:35.955329+00	bwqu47azc7prgxqayntpkjz9zse	1	card	Gardening	{"contentOrder":[],"icon":"🌳","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"afpy8s7i45frggprmfsqngsocqh"}}	1665484115957	1665484115957	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
v4yofyoz3i7bs5n6ebxn3bbexeo	2022-10-11 10:28:35.969868+00	bwqu47azc7prgxqayntpkjz9zse	1	view	Board View	{"cardOrder":["csd55okshm7ftz8ju6nfb7f8pzo","c3s6yggmhkid8zyoxfun16ihfqy","ccbp74hwobfbd8yzi96peb3ngho","ctr989gtk6typ8ezgzw7qkqoapw","czowhma7rnpgb3eczbqo3t7fijo"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cidrrzojxpfroicutox1hoyk91h","filter":{"filters":[],"operation":"and"},"groupById":"a9zf59u8x1rf4ywctpcqama7tio","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["an51dnkenmoog9cetapbc4uyt3y","afpy8s7i45frggprmfsqngsocqh","aj4jyekqqssatjcq7r7chmy19ey",""],"visiblePropertyIds":["a9zf59u8x1rf4ywctpcqama7tio"]}	1665484115972	1665484115972	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
7d6c9u7hgmjr7ikhms4fpegjbcy	2022-10-11 10:28:35.984777+00	c3s6yggmhkid8zyoxfun16ihfqy	1	checkbox	Mobile phone	{"value":true}	1665484115987	1665484115987	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
78a4ka9zhrfd9dykaqh4uqxynda	2022-10-11 10:28:36.000637+00	csd55okshm7ftz8ju6nfb7f8pzo	1	checkbox	Cereal	{"value":false}	1665484116003	1665484116003	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
7fqih5dhi83yspmbwi5ptufu3gw	2022-10-11 10:28:36.015402+00	csd55okshm7ftz8ju6nfb7f8pzo	1	checkbox	Bread	{"value":false}	1665484116017	1665484116017	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
7e4qi6tioht859ccdykbnf3ytgr	2022-10-11 10:28:36.029619+00	csd55okshm7ftz8ju6nfb7f8pzo	1	checkbox	Bananas	{"value":false}	1665484116032	1665484116032	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
at7o5i6a6eif8jyu46eji79htxo	2022-10-11 10:28:36.043929+00	csd55okshm7ftz8ju6nfb7f8pzo	1	text	## Grocery list	{}	1665484116046	1665484116046	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
arjebudzzuf8e7dnmh6xf6mjxqo	2022-10-11 10:28:36.058266+00	ccbp74hwobfbd8yzi96peb3ngho	1	text	## Goal\nWalk at least 10,000 steps every day.	{}	1665484116060	1665484116060	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
abwz6he7bipy93ye9oqqutyjp1c	2022-10-11 10:28:36.078015+00	ctr989gtk6typ8ezgzw7qkqoapw	1	text		{}	1665484116080	1665484116080	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
chbe1ody1p7gudm8nf4qmprypeh	2022-10-11 10:28:36.198302+00	b6cuu7ogc4pyeijcxh3anappg6y	1	card	Identify dependencies	{"contentOrder":["a7yxbb4kusp8ztdh15af89shgee","7kx86itgmjbrymnz6goq1bzd1fc","aj77myg5oqfyjjkc9fsk7f9u4dr","75k5m8qwis3r63p1azw9zuitjhy","74qtwt7fag7gzpbgcbbxgu5kwjc","7gwdu5yphdpbu9jos3k3es154go","7q1yitzpo4bgsmc848dbsrw683h"],"icon":"🔗","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"16","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ayz81h9f3dwp7rzzbdebesc7ute","d3d682bf-e074-49d9-8df5-7320921c2d23":"98a57627-0f76-471d-850d-91f3ed9fd213"}}	1665484116200	1665484116200	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
cmbngfj16pfnzij6six8ak7pjqh	2022-10-11 10:28:36.212848+00	b6cuu7ogc4pyeijcxh3anappg6y	1	card	Requirements sign-off	{"contentOrder":["a5uodhfjkg7rpixif8pt1uk88to","7u75uuudybpnrdxuy46azw8cter","aen75btdasbyk3f6bi836bccs8w","7fuu6x5fzo7rnjko1c6i65aj3ka","7cofo45wksif45kjobmfh5g3mzo","7msb5wjtwgtnrxkdf79oe8o6roo","7f3nzbsh7d3fe9rs88iub16az3o"],"icon":"🖋️","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"8","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ayz81h9f3dwp7rzzbdebesc7ute","d3d682bf-e074-49d9-8df5-7320921c2d23":"d3bfb50f-f569-4bad-8a3a-dd15c3f60101"}}	1665484116215	1665484116215	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
ctrr4h3o11jyzjkhimwp13q5rur	2022-10-11 10:28:36.2277+00	b6cuu7ogc4pyeijcxh3anappg6y	1	card	Conduct market analysis	{"contentOrder":["aeio17fupd3d3fxgmpmbts14khr","768d5mwnwntbb8qjn4ufdgf8few","atyiojfpbbfdifdkffkfumdxd7o","7kmunyiqyyp8ftqy3sr3x9azfzr","7yugrg7yb9fyuxxhn9oasy4ufxr","77a85z5y697fqtpaiuggu5bog6w","749pbj8jf97dhbkugh4ni6atrkw"],"icon":"📈","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"40","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ar6b8m3jxr3asyxhr8iucdbo6yc","d3d682bf-e074-49d9-8df5-7320921c2d23":"87f59784-b859-4c24-8ebe-17c766e081dd"}}	1665484116230	1665484116230	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
vh7ptebnww7nkpfsex4nuku4b7r	2022-10-11 10:28:36.608387+00	bxgo46mjubbr53q3m9qzphodsiy	1	view	By Status	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"af6fcbb8-ca56-4b73-83eb-37437b9a667d","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","77c539af-309c-4db1-8329-d20ef7e9eacd","98bdea27-0cce-4cde-8dc6-212add36e63a",""],"visiblePropertyIds":["d9725d14-d5a8-48e5-8de1-6f8c004a9680","d6b1249b-bc18-45fc-889e-bec48fce80ef"]}	1665484116611	1665484116610	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
agmbibza1ztrxibzidaq9k7os5r	2022-10-11 10:28:36.976659+00	ccti3h7zsxigppxafizydxqqr9h	1	text	## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*	{}	1665484116979	1665484116979	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
c8xewtyxeo3ysprnqed7d6go3aa	2022-10-11 10:28:36.220158+00	b6cuu7ogc4pyeijcxh3anappg6y	1	card	Project budget approval	{"contentOrder":["afsh8qrpkn3giip7t4shmgu9q6e","76b5d64urebdxdky1upt9xqd5io","a9hsepangsjbp3mtbg436biey5e","71niyx53dwjb15jwg1ostndq9oy","733zbgfx9rprzzghddf6wk79bmo","7fiatgq91hirz7fm6hi8rjrne4e","7d7wyxfhbbbrobge5eg63h6owxr"],"icon":"💵","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"16","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ayz81h9f3dwp7rzzbdebesc7ute","d3d682bf-e074-49d9-8df5-7320921c2d23":"d3bfb50f-f569-4bad-8a3a-dd15c3f60101"}}	1665484116222	1665484116222	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
ve5y91we9xjdhdqkfw9dzsdrjgo	2022-10-11 10:28:36.234863+00	b6cuu7ogc4pyeijcxh3anappg6y	1	view	Project Priorities	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"d3d682bf-e074-49d9-8df5-7320921c2d23","hiddenOptionIds":[],"kanbanCalculations":{"":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"87f59784-b859-4c24-8ebe-17c766e081dd":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"98a57627-0f76-471d-850d-91f3ed9fd213":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"d3bfb50f-f569-4bad-8a3a-dd15c3f60101":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"}},"sortOptions":[],"viewType":"board","visibleOptionIds":["d3bfb50f-f569-4bad-8a3a-dd15c3f60101","87f59784-b859-4c24-8ebe-17c766e081dd","98a57627-0f76-471d-850d-91f3ed9fd213",""],"visiblePropertyIds":["a972dc7a-5f4c-45d2-8044-8c28c69717f1","a8daz81s4xjgke1ww6cwik5w7ye"]}	1665484116237	1665484116237	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
vx7pj46citpfs8dhf155rykgqxo	2022-10-11 10:28:36.25006+00	b6cuu7ogc4pyeijcxh3anappg6y	1	view	Task Overview	{"cardOrder":["c6k1gzxcgjffg9pwoedi81pxgpo","ctrr4h3o11jyzjkhimwp13q5rur","chbe1ody1p7gudm8nf4qmprypeh","c8xewtyxeo3ysprnqed7d6go3aa","cmbngfj16pfnzij6six8ak7pjqh","cz8p8gofakfby8kzz83j97db8ph","ce1jm5q5i54enhuu4h3kkay1hcc"],"collapsedOptionIds":[],"columnCalculations":{"a8daz81s4xjgke1ww6cwik5w7ye":"sum"},"columnWidths":{"2a5da320-735c-4093-8787-f56e15cdfeed":196,"__title":280,"a8daz81s4xjgke1ww6cwik5w7ye":139,"a972dc7a-5f4c-45d2-8044-8c28c69717f1":141,"d3d682bf-e074-49d9-8df5-7320921c2d23":110},"defaultTemplateId":"czw9es1e89fdpjr7cqptr1xq7qh","filter":{"filters":[],"operation":"and"},"groupById":"","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["a972dc7a-5f4c-45d2-8044-8c28c69717f1","d3d682bf-e074-49d9-8df5-7320921c2d23","2a5da320-735c-4093-8787-f56e15cdfeed","a3zsw7xs8sxy7atj8b6totp3mby","axkhqa4jxr3jcqe4k87g8bhmary","a7gdnz8ff8iyuqmzddjgmgo9ery","a8daz81s4xjgke1ww6cwik5w7ye"]}	1665484116252	1665484116252	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
75k5m8qwis3r63p1azw9zuitjhy	2022-10-11 10:28:36.264572+00	chbe1ody1p7gudm8nf4qmprypeh	1	checkbox	[Subtask 1]	{"value":false}	1665484116266	1665484116266	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7kx86itgmjbrymnz6goq1bzd1fc	2022-10-11 10:28:36.279064+00	chbe1ody1p7gudm8nf4qmprypeh	1	divider		{}	1665484116281	1665484116281	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7gwdu5yphdpbu9jos3k3es154go	2022-10-11 10:28:36.293453+00	chbe1ody1p7gudm8nf4qmprypeh	1	checkbox	[Subtask 3]	{"value":false}	1665484116295	1665484116295	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
a7yxbb4kusp8ztdh15af89shgee	2022-10-11 10:28:36.307989+00	chbe1ody1p7gudm8nf4qmprypeh	1	text	## Description\n*[Brief description of this task]*	{}	1665484116310	1665484116310	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7y5sm9gjd3jgbtx5qcueqmfhy9a	2022-10-11 10:28:36.322496+00	c6k1gzxcgjffg9pwoedi81pxgpo	1	checkbox	...	{"value":false}	1665484116324	1665484116324	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7k85ozpk7qjy6mccicb9kuibw6r	2022-10-11 10:28:36.336885+00	c6k1gzxcgjffg9pwoedi81pxgpo	1	checkbox	[Subtask 3]	{"value":false}	1665484116339	1665484116339	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
ab6qh1ypdtbfsuenf33nzamg8zh	2022-10-11 10:28:36.350967+00	c6k1gzxcgjffg9pwoedi81pxgpo	1	text	## Checklist	{}	1665484116353	1665484116353	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7f3nzbsh7d3fe9rs88iub16az3o	2022-10-11 10:28:36.364886+00	cmbngfj16pfnzij6six8ak7pjqh	1	checkbox	...	{"value":false}	1665484116367	1665484116367	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7u75uuudybpnrdxuy46azw8cter	2022-10-11 10:28:36.379046+00	cmbngfj16pfnzij6six8ak7pjqh	1	divider		{}	1665484116381	1665484116381	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7fuu6x5fzo7rnjko1c6i65aj3ka	2022-10-11 10:28:36.393995+00	cmbngfj16pfnzij6six8ak7pjqh	1	checkbox	[Subtask 1]	{"value":false}	1665484116396	1665484116396	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
aen75btdasbyk3f6bi836bccs8w	2022-10-11 10:28:36.407911+00	cmbngfj16pfnzij6six8ak7pjqh	1	text	## Checklist	{}	1665484116410	1665484116410	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
71niyx53dwjb15jwg1ostndq9oy	2022-10-11 10:28:36.422316+00	c8xewtyxeo3ysprnqed7d6go3aa	1	checkbox	[Subtask 1]	{"value":false}	1665484116424	1665484116424	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7d7wyxfhbbbrobge5eg63h6owxr	2022-10-11 10:28:36.436479+00	c8xewtyxeo3ysprnqed7d6go3aa	1	checkbox	...	{"value":false}	1665484116438	1665484116438	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
a9hsepangsjbp3mtbg436biey5e	2022-10-11 10:28:36.450609+00	c8xewtyxeo3ysprnqed7d6go3aa	1	text	## Checklist	{}	1665484116452	1665484116452	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
749pbj8jf97dhbkugh4ni6atrkw	2022-10-11 10:28:36.464984+00	ctrr4h3o11jyzjkhimwp13q5rur	1	checkbox	...	{"value":false}	1665484116467	1665484116467	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
768d5mwnwntbb8qjn4ufdgf8few	2022-10-11 10:28:36.479349+00	ctrr4h3o11jyzjkhimwp13q5rur	1	divider		{}	1665484116481	1665484116481	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7kmunyiqyyp8ftqy3sr3x9azfzr	2022-10-11 10:28:36.494045+00	ctrr4h3o11jyzjkhimwp13q5rur	1	checkbox	[Subtask 1]	{"value":false}	1665484116496	1665484116496	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
atyiojfpbbfdifdkffkfumdxd7o	2022-10-11 10:28:36.508625+00	ctrr4h3o11jyzjkhimwp13q5rur	1	text	## Checklist	{}	1665484116510	1665484116510	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7xgyuabsfkibpxfpf1dc3sutcqr	2022-10-11 10:28:36.523236+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	[Subtask 2]	{"value":false}	1665484116525	1665484116525	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7eptgw7s87pyepdpo4hnqx713ho	2022-10-11 10:28:36.53837+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	[Subtask 1]	{"value":false}	1665484116540	1665484116540	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
a9dyiic9fppnopr4okfj8zsf9dh	2022-10-11 10:28:36.554713+00	czw9es1e89fdpjr7cqptr1xq7qh	1	text	## Description\n*[Brief description of this task]*	{}	1665484116557	1665484116557	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
ank5cpbddh7dy8fxfkcjkd8sxqy	2022-10-11 10:28:36.902236+00	chtobgq1x63rbukyzq3et8dcnar	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1665484116904	1665484116904	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
apedp4m1mkp8ymxrtkqjo7exq9w	2022-10-11 10:28:36.917729+00	cfefgwjke6bbxpjpig618g9bpte	1	text	## Screenshots\nIf applicable, add screenshots to elaborate on the problem.	{}	1665484116920	1665484116920	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
vbax4x1grbfr1mfm8sdtpcq5dic	2022-10-11 10:28:36.24231+00	b6cuu7ogc4pyeijcxh3anappg6y	1	view	Progress Tracker	{"cardOrder":["c8xewtyxeo3ysprnqed7d6go3aa","cmbngfj16pfnzij6six8ak7pjqh","chbe1ody1p7gudm8nf4qmprypeh","ctrr4h3o11jyzjkhimwp13q5rur","c6k1gzxcgjffg9pwoedi81pxgpo","coxnjt3ro1in19dd1e3awdt338r"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"czw9es1e89fdpjr7cqptr1xq7qh","filter":{"filters":[],"operation":"and"},"groupById":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","hiddenOptionIds":[],"kanbanCalculations":{"":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"adeo5xuwne3qjue83fcozekz8ko":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"afi4o5nhnqc3smtzs1hs3ij34dh":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"ahpyxfnnrzynsw3im1psxpkgtpe":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"ar6b8m3jxr3asyxhr8iucdbo6yc":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"ayz81h9f3dwp7rzzbdebesc7ute":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"}},"sortOptions":[],"viewType":"board","visibleOptionIds":["ayz81h9f3dwp7rzzbdebesc7ute","ar6b8m3jxr3asyxhr8iucdbo6yc","afi4o5nhnqc3smtzs1hs3ij34dh","adeo5xuwne3qjue83fcozekz8ko","ahpyxfnnrzynsw3im1psxpkgtpe",""],"visiblePropertyIds":["d3d682bf-e074-49d9-8df5-7320921c2d23","a8daz81s4xjgke1ww6cwik5w7ye"]}	1665484116244	1665484116244	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
v5qafk1c6gtgepmus4kcok1uryr	2022-10-11 10:28:36.257483+00	b6cuu7ogc4pyeijcxh3anappg6y	1	view	Task Calendar	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"a3zsw7xs8sxy7atj8b6totp3mby","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1665484116259	1665484116259	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
74qtwt7fag7gzpbgcbbxgu5kwjc	2022-10-11 10:28:36.271763+00	chbe1ody1p7gudm8nf4qmprypeh	1	checkbox	[Subtask 2]	{"value":false}	1665484116274	1665484116274	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7q1yitzpo4bgsmc848dbsrw683h	2022-10-11 10:28:36.286144+00	chbe1ody1p7gudm8nf4qmprypeh	1	checkbox	...	{"value":false}	1665484116288	1665484116288	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
aj77myg5oqfyjjkc9fsk7f9u4dr	2022-10-11 10:28:36.300703+00	chbe1ody1p7gudm8nf4qmprypeh	1	text	## Checklist	{}	1665484116303	1665484116303	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7up99ooneatfemqztr3ppz6c65a	2022-10-11 10:28:36.315078+00	c6k1gzxcgjffg9pwoedi81pxgpo	1	checkbox	[Subtask 2]	{"value":false}	1665484116317	1665484116317	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7gx789wt1ptgs9n9zqicwfys8xw	2022-10-11 10:28:36.329622+00	c6k1gzxcgjffg9pwoedi81pxgpo	1	checkbox	[Subtask 1]	{"value":false}	1665484116332	1665484116332	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7zqpu5mw7ojn77e1txcm5313iho	2022-10-11 10:28:36.343855+00	c6k1gzxcgjffg9pwoedi81pxgpo	1	divider		{}	1665484116346	1665484116346	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
an79yua3fujfspjhgh898kbcyea	2022-10-11 10:28:36.358055+00	c6k1gzxcgjffg9pwoedi81pxgpo	1	text	## Description\n*[Brief description of this task]*	{}	1665484116360	1665484116360	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7cofo45wksif45kjobmfh5g3mzo	2022-10-11 10:28:36.371865+00	cmbngfj16pfnzij6six8ak7pjqh	1	checkbox	[Subtask 2]	{"value":false}	1665484116374	1665484116374	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7msb5wjtwgtnrxkdf79oe8o6roo	2022-10-11 10:28:36.386493+00	cmbngfj16pfnzij6six8ak7pjqh	1	checkbox	[Subtask 3]	{"value":false}	1665484116388	1665484116388	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
a5uodhfjkg7rpixif8pt1uk88to	2022-10-11 10:28:36.401035+00	cmbngfj16pfnzij6six8ak7pjqh	1	text	## Description\n*[Brief description of this task]*	{}	1665484116403	1665484116403	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
76b5d64urebdxdky1upt9xqd5io	2022-10-11 10:28:36.41504+00	c8xewtyxeo3ysprnqed7d6go3aa	1	divider		{}	1665484116417	1665484116417	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7fiatgq91hirz7fm6hi8rjrne4e	2022-10-11 10:28:36.42955+00	c8xewtyxeo3ysprnqed7d6go3aa	1	checkbox	[Subtask 3]	{"value":false}	1665484116431	1665484116431	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
733zbgfx9rprzzghddf6wk79bmo	2022-10-11 10:28:36.443738+00	c8xewtyxeo3ysprnqed7d6go3aa	1	checkbox	[Subtask 2]	{"value":false}	1665484116446	1665484116446	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
afsh8qrpkn3giip7t4shmgu9q6e	2022-10-11 10:28:36.457526+00	c8xewtyxeo3ysprnqed7d6go3aa	1	text	## Description\n*[Brief description of this task]*	{}	1665484116459	1665484116459	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
77a85z5y697fqtpaiuggu5bog6w	2022-10-11 10:28:36.472165+00	ctrr4h3o11jyzjkhimwp13q5rur	1	checkbox	[Subtask 3]	{"value":false}	1665484116474	1665484116474	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7yugrg7yb9fyuxxhn9oasy4ufxr	2022-10-11 10:28:36.486697+00	ctrr4h3o11jyzjkhimwp13q5rur	1	checkbox	[Subtask 2]	{"value":false}	1665484116489	1665484116489	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
aeio17fupd3d3fxgmpmbts14khr	2022-10-11 10:28:36.501333+00	ctrr4h3o11jyzjkhimwp13q5rur	1	text	## Description\n*[Brief description of this task]*	{}	1665484116503	1665484116503	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7fi4id6zhntr3zd73jto1cxxsie	2022-10-11 10:28:36.515879+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	[Subtask 3]	{"value":false}	1665484116518	1665484116518	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7by15kjutm3g8ffu68w5e51dwry	2022-10-11 10:28:36.530331+00	czw9es1e89fdpjr7cqptr1xq7qh	1	divider		{}	1665484116532	1665484116532	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7zmeekq4hofyrtqcoum6aqwthsr	2022-10-11 10:28:36.546073+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	...	{"value":false}	1665484116548	1665484116548	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
axyjb5s7fz7d9xpdn397kgoxgow	2022-10-11 10:28:36.565085+00	czw9es1e89fdpjr7cqptr1xq7qh	1	text	## Checklist	{}	1665484116567	1665484116567	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
czia6hpnyhtrbpr5fikr66hn6sy	2022-10-11 10:28:36.580222+00	bxgo46mjubbr53q3m9qzphodsiy	1	card	Start a daily journal	{"contentOrder":[],"icon":"✍️","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","d6b1249b-bc18-45fc-889e-bec48fce80ef":"0a82977f-52bf-457b-841b-e2b7f76fb525","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"3245a32d-f688-463b-87f4-8e7142c1b397"}}	1665484116582	1665484116582	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
cp5iaboxt8tre5m4hxnacsdcd9c	2022-10-11 10:28:36.594254+00	bxgo46mjubbr53q3m9qzphodsiy	1	card	Learn to paint	{"contentOrder":[],"icon":"🎨","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"77c539af-309c-4db1-8329-d20ef7e9eacd","d6b1249b-bc18-45fc-889e-bec48fce80ef":"9a090e33-b110-4268-8909-132c5002c90e","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"3245a32d-f688-463b-87f4-8e7142c1b397"}}	1665484116596	1665484116596	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
7br1nnoptm7fxdd8yqu3zo9wexh	2022-10-11 10:28:37.182047+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	Set priorities and update statuses	{"value":false}	1665484117184	1665484117184	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
bxgo46mjubbr53q3m9qzphodsiy	2022-10-11 10:28:36.572972+00		1	board	Personal Goals 	{"cardProperties":[{"id":"af6fcbb8-ca56-4b73-83eb-37437b9a667d","name":"Status","options":[{"color":"propColorRed","id":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","value":"To Do"},{"color":"propColorYellow","id":"77c539af-309c-4db1-8329-d20ef7e9eacd","value":"Doing"},{"color":"propColorGreen","id":"98bdea27-0cce-4cde-8dc6-212add36e63a","value":"Done 🙌"}],"type":"select"},{"id":"d9725d14-d5a8-48e5-8de1-6f8c004a9680","name":"Category","options":[{"color":"propColorPurple","id":"3245a32d-f688-463b-87f4-8e7142c1b397","value":"Life Skills"},{"color":"propColorGreen","id":"80be816c-fc7a-4928-8489-8b02180f4954","value":"Finance"},{"color":"propColorOrange","id":"ffb3f951-b47f-413b-8f1d-238666728008","value":"Health"}],"type":"select"},{"id":"d6b1249b-bc18-45fc-889e-bec48fce80ef","name":"Target","options":[{"color":"propColorBlue","id":"9a090e33-b110-4268-8909-132c5002c90e","value":"Q1"},{"color":"propColorBrown","id":"0a82977f-52bf-457b-841b-e2b7f76fb525","value":"Q2"},{"color":"propColorGreen","id":"6e7139e4-5358-46bb-8c01-7b029a57b80a","value":"Q3"},{"color":"propColorPurple","id":"d5371c63-66bf-4468-8738-c4dc4bea4843","value":"Q4"}],"type":"select"},{"id":"ajy6xbebzopojaenbnmfpgtdwso","name":"Due Date","options":[],"type":"date"}],"description":"Use this template to set and accomplish new personal goals.","icon":"⛰️","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"7f32dc8d2ae008cfe56554e9363505cc"}	1665484116575	1665484116575	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
cuuis4prya7f8xbbcxwgut86eny	2022-10-11 10:28:36.587294+00	bxgo46mjubbr53q3m9qzphodsiy	1	card	Run 3 times a week	{"contentOrder":[],"icon":"🏃","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","d6b1249b-bc18-45fc-889e-bec48fce80ef":"6e7139e4-5358-46bb-8c01-7b029a57b80a","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"ffb3f951-b47f-413b-8f1d-238666728008"}}	1665484116589	1665484116589	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
ctnof4dg57fnftxembthdx1bhgo	2022-10-11 10:28:36.6017+00	bxgo46mjubbr53q3m9qzphodsiy	1	card	Open retirement account	{"contentOrder":[],"icon":"🏦","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","d6b1249b-bc18-45fc-889e-bec48fce80ef":"0a82977f-52bf-457b-841b-e2b7f76fb525","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"80be816c-fc7a-4928-8489-8b02180f4954"}}	1665484116603	1665484116603	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
v8h5wpe7p5by19fqzftoq6m35qo	2022-10-11 10:28:36.617852+00	bxgo46mjubbr53q3m9qzphodsiy	1	view	Calendar View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"ajy6xbebzopojaenbnmfpgtdwso","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1665484116620	1665484116620	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
btc3d9eo5dfd8txgdpi9unukije	2022-10-11 10:28:36.632171+00		1	board	Content Calendar 	{"cardProperties":[{"id":"ae9ar615xoknd8hw8py7mbyr7zo","name":"Status","options":[{"color":"propColorGray","id":"awna1nuarjca99m9s4uiy9kwj5h","value":"Idea 💡"},{"color":"propColorOrange","id":"a9ana1e9w673o5cp8md4xjjwfto","value":"Draft"},{"color":"propColorPurple","id":"apy9dcd7zmand615p3h53zjqxjh","value":"In Review"},{"color":"propColorBlue","id":"acri4cm3bmay55f7ksztphmtnga","value":"Ready to Publish"},{"color":"propColorGreen","id":"amsowcd9a8e1kid317r7ttw6uzh","value":"Published 🎉"}],"type":"select"},{"id":"aysx3atqexotgwp5kx6h5i5ancw","name":"Type","options":[{"color":"propColorOrange","id":"aywiofmmtd3ofgzj95ysky4pjga","value":"Press Release"},{"color":"propColorGreen","id":"apqdgjrmsmx8ngmp7zst51647de","value":"Sponsored Post"},{"color":"propColorPurple","id":"a3woynbjnb7j16e74uw3pubrytw","value":"Customer Story"},{"color":"propColorRed","id":"aq36k5pkpfcypqb3idw36xdi1fh","value":"Product Release"},{"color":"propColorGray","id":"azn66pmk34adygnizjqhgiac4ia","value":"Partnership"},{"color":"propColorBlue","id":"aj8y675weso8kpb6eceqbpj4ruw","value":"Feature Announcement"},{"color":"propColorYellow","id":"a3xky7ygn14osr1mokerbfah5cy","value":"Article"}],"type":"select"},{"id":"ab6mbock6styfe6htf815ph1mhw","name":"Channel","options":[{"color":"propColorBrown","id":"a8xceonxiu4n3c43szhskqizicr","value":"Website"},{"color":"propColorGreen","id":"a3pdzi53kpbd4okzdkz6khi87zo","value":"Blog"},{"color":"propColorOrange","id":"a3d9ux4fmi3anyd11kyipfbhwde","value":"Email"},{"color":"propColorRed","id":"a8cbbfdwocx73zn3787cx6gacsh","value":"Podcast"},{"color":"propColorPink","id":"aigjtpcaxdp7d6kmctrwo1ztaia","value":"Print"},{"color":"propColorBlue","id":"af1wsn13muho59e7ghwaogxy5ey","value":"Facebook"},{"color":"propColorGray","id":"a47zajfxwhsg6q8m7ppbiqs7jge","value":"LinkedIn"},{"color":"propColorYellow","id":"az8o8pfe9hq6s7xaehoqyc3wpyc","value":"Twitter"}],"type":"multiSelect"},{"id":"ao44fz8nf6z6tuj1x31t9yyehcc","name":"Assignee","options":[],"type":"person"},{"id":"a39x5cybshwrbjpc3juaakcyj6e","name":"Due Date","options":[],"type":"date"},{"id":"agqsoiipowmnu9rdwxm57zrehtr","name":"Publication Date","options":[],"type":"date"},{"id":"ap4e7kdg7eip7j3c3oyiz39eaoc","name":"Link","options":[],"type":"url"}],"description":"Use this template to plan and organize your editorial content.","icon":"📅","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"c75fbd659d2258b5183af2236d176ab4"}	1665484116634	1665484116634	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
cifr5gut6dpg69khjc914aagdic	2022-10-11 10:28:36.646574+00	btc3d9eo5dfd8txgdpi9unukije	1	card	[Tweet] Mattermost v6.1 includes card @-mention notifications in Boards	{"contentOrder":["7i96m7nbsdsex8n6hzuzrmdfjuy","7ed5bwp3gr8yax3mhtuwiaa9gjy","as4jknoo8978a58afrb7n467y6e","a7s5x1y1mdbnejf9xic5i54wtpa","abdasiyq4k7ndtfrdadrias8sjy","78zyx6dk31brk5rrcfjypibzpwo"],"icon":"🐤","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1639051200000}","ab6mbock6styfe6htf815ph1mhw":["az8o8pfe9hq6s7xaehoqyc3wpyc"],"ae9ar615xoknd8hw8py7mbyr7zo":"a9ana1e9w673o5cp8md4xjjwfto","agqsoiipowmnu9rdwxm57zrehtr":"{\\"from\\":1637668800000}","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://twitter.com/Mattermost/status/1463145633162969097?s=20","aysx3atqexotgwp5kx6h5i5ancw":"aj8y675weso8kpb6eceqbpj4ruw"}}	1665484116649	1665484116649	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
c3k9fdqp89pgypbe3boahwmtsta	2022-10-11 10:28:36.66182+00	btc3d9eo5dfd8txgdpi9unukije	1	card	Unblocking Workflows: The Guide to Developer Productivity	{"contentOrder":["77tz16jtz5x73ncs3dxc3fp1d7h","a1bzap4zq6ibhdcyci4b7cn8wko"],"icon":"💻","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1638532800000}","ab6mbock6styfe6htf815ph1mhw":["a3pdzi53kpbd4okzdkz6khi87zo"],"ae9ar615xoknd8hw8py7mbyr7zo":"apy9dcd7zmand615p3h53zjqxjh","agqsoiipowmnu9rdwxm57zrehtr":"{\\"from\\":1639483200000}","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://mattermost.com/newsroom/press-releases/mattermost-unveils-definitive-report-on-the-state-of-developer-productivity-unblocking-workflows-the-guide-to-developer-productivity-2022-edition/","aysx3atqexotgwp5kx6h5i5ancw":"a3xky7ygn14osr1mokerbfah5cy"}}	1665484116664	1665484116664	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
v574kgjuhcift8c89jsg1r4b71o	2022-10-11 10:28:36.676301+00	btc3d9eo5dfd8txgdpi9unukije	1	view	Due Date Calendar	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"a39x5cybshwrbjpc3juaakcyj6e","defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1665484116678	1665484116678	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
aw6yqos1j1bbyzpogh3cusif96o	2022-10-11 10:28:36.932685+00	cfefgwjke6bbxpjpig618g9bpte	1	text	## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\n*[A clear and concise description of what you expected to happen.]*\n\n## Screenshots\n\n*[If applicable, add screenshots to elaborate on the problem.]*\n\n## Edition and Platform\n\n - Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n - Version: *[e.g. v0.9.0]*\n - Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n\n*[Add any other context about the problem here.]*	{}	1665484116935	1665484116935	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
v5jkjadjdx3ryzjxbi56hr47opo	2022-10-11 10:28:36.624484+00	bxgo46mjubbr53q3m9qzphodsiy	1	view	By Date	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"d6b1249b-bc18-45fc-889e-bec48fce80ef","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["9a090e33-b110-4268-8909-132c5002c90e","0a82977f-52bf-457b-841b-e2b7f76fb525","6e7139e4-5358-46bb-8c01-7b029a57b80a","d5371c63-66bf-4468-8738-c4dc4bea4843",""],"visiblePropertyIds":["d9725d14-d5a8-48e5-8de1-6f8c004a9680"]}	1665484116626	1665484116626	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
crhupzoiscpydpbay9ogofgzb1w	2022-10-11 10:28:36.639751+00	btc3d9eo5dfd8txgdpi9unukije	1	card	New Project and Workflow Management Solutions for Developers	{"contentOrder":["71qhnzuec6esdi6fnynwpze4xya","abuy87xcsfprnpmy8zbfej73j6o"],"icon":"🎯","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1645790400000}","ab6mbock6styfe6htf815ph1mhw":["a8xceonxiu4n3c43szhskqizicr","a3pdzi53kpbd4okzdkz6khi87zo","a3d9ux4fmi3anyd11kyipfbhwde"],"ae9ar615xoknd8hw8py7mbyr7zo":"awna1nuarjca99m9s4uiy9kwj5h","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://mattermost.com/newsroom/press-releases/mattermost-launches-new-project-and-workflow-management-solutions-for-developers/","aysx3atqexotgwp5kx6h5i5ancw":"aywiofmmtd3ofgzj95ysky4pjga"}}	1665484116642	1665484116642	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
cnkpwjnu867f73y3pdtj4f55hge	2022-10-11 10:28:36.654043+00	btc3d9eo5dfd8txgdpi9unukije	1	card	Top 10 Must-Have DevOps Tools in 2021	{"contentOrder":["7fo1utqc8x1z1z6hzg33hes1ktc","aiwd71qpf77fkxe9pga81gr43zw"],"icon":"🛠️","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1636113600000}","ab6mbock6styfe6htf815ph1mhw":["a8xceonxiu4n3c43szhskqizicr"],"ae9ar615xoknd8hw8py7mbyr7zo":"a9ana1e9w673o5cp8md4xjjwfto","agqsoiipowmnu9rdwxm57zrehtr":"{\\"from\\":1637323200000}","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://www.toolbox.com/tech/devops/articles/best-devops-tools/","aysx3atqexotgwp5kx6h5i5ancw":"a3xky7ygn14osr1mokerbfah5cy"}}	1665484116656	1665484116656	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
v7p5xcadfc3bfzyukb3b3dfo6wr	2022-10-11 10:28:36.668908+00	btc3d9eo5dfd8txgdpi9unukije	1	view	By Status	{"cardOrder":[null,"cdbfkd15d6iy18rgx1tskmfsr6c","cn8yofg9rtkgmzgmb5xdi56p3ic","csgsnnywpuqzs5jgq87snk9x17e","cqwaytore5y487wdu8zffppqnea",null],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["awna1nuarjca99m9s4uiy9kwj5h","a9ana1e9w673o5cp8md4xjjwfto","apy9dcd7zmand615p3h53zjqxjh","acri4cm3bmay55f7ksztphmtnga","amsowcd9a8e1kid317r7ttw6uzh",""],"visiblePropertyIds":["ab6mbock6styfe6htf815ph1mhw"]}	1665484116671	1665484116671	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
vgi13ig38ttbffpug5u4z4yx9wo	2022-10-11 10:28:36.683462+00	btc3d9eo5dfd8txgdpi9unukije	1	view	Publication Calendar	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"agqsoiipowmnu9rdwxm57zrehtr","defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1665484116685	1665484116685	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
abuy87xcsfprnpmy8zbfej73j6o	2022-10-11 10:28:36.698209+00	crhupzoiscpydpbay9ogofgzb1w	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1665484116700	1665484116700	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
as4jknoo8978a58afrb7n467y6e	2022-10-11 10:28:36.712017+00	cifr5gut6dpg69khjc914aagdic	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1665484116714	1665484116714	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
ajupzqkhcpfrofxqpg3scyiwaee	2022-10-11 10:28:36.726323+00	cff1jmrxfrirgbeebhr9qd7nida	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1665484116728	1665484116728	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
adcxzq9aunbf45guxsc8srcsxxw	2022-10-11 10:28:36.74115+00	cff1jmrxfrirgbeebhr9qd7nida	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1665484116743	1665484116743	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
a1bzap4zq6ibhdcyci4b7cn8wko	2022-10-11 10:28:36.756611+00	c3k9fdqp89pgypbe3boahwmtsta	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1665484116759	1665484116759	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
c4k4dqm7ixibc3ekbsptgi174ao	2022-10-11 10:28:36.784974+00	b41kxw97cd7899ctkgswuoe811w	1	card	App crashing	{"contentOrder":["79t7rkiuspeneqi9xurou9tqzwh","aewhyyg7pcbbd7euy4yhm4wyhio","ay61uqe1u9jfg8ntzfyejdc1e4e","73j3wx3hocpbxxc5wgrpxmusm4o"],"icon":"📉","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"1fdbb515-edd2-4af5-80fc-437ed2211a49","50117d52-bcc7-4750-82aa-831a351c44a0":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","60985f46-3e41-486e-8213-2b987440ea1c":"c01676ca-babf-4534-8be5-cce2287daa6c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9"}}	1665484116787	1665484116787	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
chtobgq1x63rbukyzq3et8dcnar	2022-10-11 10:28:36.799257+00	b41kxw97cd7899ctkgswuoe811w	1	card	Standard templates	{"contentOrder":["7uonmjk41nipnrsi6tz8wau5ssh","ank5cpbddh7dy8fxfkcjkd8sxqy"],"icon":"🗺️","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"6eea96c9-4c61-4968-8554-4b7537e8f748","50117d52-bcc7-4750-82aa-831a351c44a0":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","60985f46-3e41-486e-8213-2b987440ea1c":"ed4a5340-460d-461b-8838-2c56e8ee59fe","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1665484116801	1665484116801	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
cmtnbp3xc7ibzfbr34wcz9yzxcc	2022-10-11 10:28:36.81372+00	b41kxw97cd7899ctkgswuoe811w	1	card	Review API design	{"contentOrder":["a5yqeyxuxypg97g85uo5ttq176e"],"icon":"🛣️","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"424ea5e3-9aa1-4075-8c5c-01b44b66e634","50117d52-bcc7-4750-82aa-831a351c44a0":"8c557f69-b0ed-46ec-83a3-8efab9d47ef5","60985f46-3e41-486e-8213-2b987440ea1c":"14892380-1a32-42dd-8034-a0cea32bc7e6","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"c62172ea-5da7-4dec-8186-37267d8ee9a7"}}	1665484116816	1665484116816	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
vxqbydmf84tf7xnemqw7e9bo43c	2022-10-11 10:28:36.828678+00	b41kxw97cd7899ctkgswuoe811w	1	view	Calendar View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"a4378omyhmgj3bex13sj4wbpfiy","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1665484116831	1665484116831	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
ad31ry1q5ifnkdm87en31545gky	2022-10-11 10:28:36.94838+00	cidz4imnqhir48brz6e8hxhfrhy	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1665484116950	1665484116950	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
vu41qq5cg1bdedfna1aagfe6kjh	2022-10-11 10:28:36.690861+00	btc3d9eo5dfd8txgdpi9unukije	1	view	Content List	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"__title":322,"ab6mbock6styfe6htf815ph1mhw":229,"aysx3atqexotgwp5kx6h5i5ancw":208},"defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"a39x5cybshwrbjpc3juaakcyj6e","reversed":false}],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["ae9ar615xoknd8hw8py7mbyr7zo","aysx3atqexotgwp5kx6h5i5ancw","ab6mbock6styfe6htf815ph1mhw","ao44fz8nf6z6tuj1x31t9yyehcc","a39x5cybshwrbjpc3juaakcyj6e","agqsoiipowmnu9rdwxm57zrehtr","ap4e7kdg7eip7j3c3oyiz39eaoc"]}	1665484116693	1665484116693	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
78zyx6dk31brk5rrcfjypibzpwo	2022-10-11 10:28:36.705272+00	cifr5gut6dpg69khjc914aagdic	1	image		{"fileId":"7y5kr8x8ybpnwdykjfuz57rggrh.png"}	1665484116707	1665484116707	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
a7s5x1y1mdbnejf9xic5i54wtpa	2022-10-11 10:28:36.719314+00	cifr5gut6dpg69khjc914aagdic	1	text	## Media	{}	1665484116721	1665484116721	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
a5dp1j9zzo3dui8i53d7hyajtkc	2022-10-11 10:28:36.734229+00	cff1jmrxfrirgbeebhr9qd7nida	1	text	## Research\n- ...\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n- ...\n\n## Notes\n- ...\n- ...\n- ...	{}	1665484116736	1665484116736	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
aiwd71qpf77fkxe9pga81gr43zw	2022-10-11 10:28:36.748886+00	cnkpwjnu867f73y3pdtj4f55hge	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1665484116751	1665484116751	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
b41kxw97cd7899ctkgswuoe811w	2022-10-11 10:28:36.777929+00		1	board	Roadmap 	{"cardProperties":[{"id":"50117d52-bcc7-4750-82aa-831a351c44a0","name":"Status","options":[{"color":"propColorGray","id":"8c557f69-b0ed-46ec-83a3-8efab9d47ef5","value":"Not Started"},{"color":"propColorYellow","id":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","value":"In Progress"},{"color":"propColorGreen","id":"849766ba-56a5-48d1-886f-21672f415395","value":"Complete 🙌"}],"type":"select"},{"id":"20717ad3-5741-4416-83f1-6f133fff3d11","name":"Type","options":[{"color":"propColorYellow","id":"424ea5e3-9aa1-4075-8c5c-01b44b66e634","value":"Epic ⛰"},{"color":"propColorGreen","id":"6eea96c9-4c61-4968-8554-4b7537e8f748","value":"Task 🔨"},{"color":"propColorRed","id":"1fdbb515-edd2-4af5-80fc-437ed2211a49","value":"Bug 🐞"}],"type":"select"},{"id":"60985f46-3e41-486e-8213-2b987440ea1c","name":"Sprint","options":[{"color":"propColorBrown","id":"c01676ca-babf-4534-8be5-cce2287daa6c","value":"Sprint 1"},{"color":"propColorPurple","id":"ed4a5340-460d-461b-8838-2c56e8ee59fe","value":"Sprint 2"},{"color":"propColorBlue","id":"14892380-1a32-42dd-8034-a0cea32bc7e6","value":"Sprint 3"}],"type":"select"},{"id":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","name":"Priority","options":[{"color":"propColorRed","id":"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9","value":"P1 🔥"},{"color":"propColorYellow","id":"e6a7f297-4440-4783-8ab3-3af5ba62ca11","value":"P2"},{"color":"propColorGray","id":"c62172ea-5da7-4dec-8186-37267d8ee9a7","value":"P3"}],"type":"select"},{"id":"aphg37f7zbpuc3bhwhp19s1ribh","name":"Assignee","options":[],"type":"person"},{"id":"a4378omyhmgj3bex13sj4wbpfiy","name":"Due Date","options":[],"type":"date"},{"id":"a36o9q1yik6nmar6ri4q4uca7ey","name":"Created Date","options":[],"type":"createdTime"},{"id":"ai7ajsdk14w7x5s8up3dwir77te","name":"Design Link","options":[],"type":"url"}],"description":"Use this template to plan your roadmap and manage your releases more efficiently.","icon":"🗺️","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"b728c6ca730e2cfc229741c5a4712b65"}	1665484116780	1665484116780	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
cey7hpx5q8tyhzrrto7r7dnpiyy	2022-10-11 10:28:36.791861+00	b41kxw97cd7899ctkgswuoe811w	1	card	Calendar view	{"contentOrder":["7df11783ny67mdnognqae31ax6y","a7876syp5epd9dxprfjz6rbq6jo"],"icon":"📆","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"6eea96c9-4c61-4968-8554-4b7537e8f748","50117d52-bcc7-4750-82aa-831a351c44a0":"849766ba-56a5-48d1-886f-21672f415395","60985f46-3e41-486e-8213-2b987440ea1c":"c01676ca-babf-4534-8be5-cce2287daa6c","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1665484116794	1665484116794	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
cnpwidyuyb7yytbk7c7wpt3hixe	2022-10-11 10:28:36.806542+00	b41kxw97cd7899ctkgswuoe811w	1	card	Import / Export	{"contentOrder":["ahp7i9y5843riuetuq1bd31qwsc"],"icon":"🚢","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"6eea96c9-4c61-4968-8554-4b7537e8f748","50117d52-bcc7-4750-82aa-831a351c44a0":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","60985f46-3e41-486e-8213-2b987440ea1c":"c01676ca-babf-4534-8be5-cce2287daa6c","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1665484116809	1665484116808	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
ccti3h7zsxigppxafizydxqqr9h	2022-10-11 10:28:36.821532+00	b41kxw97cd7899ctkgswuoe811w	1	card	Icons don't display	{"contentOrder":["awuokcnksjjbh5b6oaspgixncqo","agmbibza1ztrxibzidaq9k7os5r","718jef5t65j8zxxnskjc9g8z85o"],"icon":"💻","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"1fdbb515-edd2-4af5-80fc-437ed2211a49","50117d52-bcc7-4750-82aa-831a351c44a0":"8c557f69-b0ed-46ec-83a3-8efab9d47ef5","60985f46-3e41-486e-8213-2b987440ea1c":"ed4a5340-460d-461b-8838-2c56e8ee59fe","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1665484116823	1665484116823	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
v6jhsou34fbna9m8igaw9p1hfec	2022-10-11 10:28:36.839036+00	b41kxw97cd7899ctkgswuoe811w	1	view	Board: Sprints	{"cardOrder":["c4k4dqm7ixibc3ekbsptgi174ao","cey7hpx5q8tyhzrrto7r7dnpiyy","chtobgq1x63rbukyzq3et8dcnar","ccti3h7zsxigppxafizydxqqr9h","cnpwidyuyb7yytbk7c7wpt3hixe","cmtnbp3xc7ibzfbr34wcz9yzxcc"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cidz4imnqhir48brz6e8hxhfrhy","filter":{"filters":[],"operation":"and"},"groupById":"60985f46-3e41-486e-8213-2b987440ea1c","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","reversed":false}],"viewType":"board","visibleOptionIds":["c01676ca-babf-4534-8be5-cce2287daa6c","ed4a5340-460d-461b-8838-2c56e8ee59fe","14892380-1a32-42dd-8034-a0cea32bc7e6",""],"visiblePropertyIds":["20717ad3-5741-4416-83f1-6f133fff3d11","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1665484116844	1665484116844	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
vw5tkfu57qfno9qyeesgqx6qarc	2022-10-11 10:28:36.857801+00	b41kxw97cd7899ctkgswuoe811w	1	view	Board: Status	{"cardOrder":["c4k4dqm7ixibc3ekbsptgi174ao","cm4w7cc3aac6s9jdcujbs4j8f4r","c6egh6cpnj137ixdoitsoxq17oo","cct9u78utsdyotmejbmwwg66ihr","cmft87it1q7yebbd51ij9k65xbw","c9fe77j9qcruxf4itzib7ag6f1c","coup7afjknqnzbdwghiwbsq541w","c5ex1hndz8qyc8gx6ofbfeksftc"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cidz4imnqhir48brz6e8hxhfrhy","filter":{"filters":[],"operation":"and"},"groupById":"50117d52-bcc7-4750-82aa-831a351c44a0","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","reversed":false}],"viewType":"board","visibleOptionIds":["8c557f69-b0ed-46ec-83a3-8efab9d47ef5","ec6d2bc5-df2b-4f77-8479-e59ceb039946","849766ba-56a5-48d1-886f-21672f415395",""],"visiblePropertyIds":["20717ad3-5741-4416-83f1-6f133fff3d11","60985f46-3e41-486e-8213-2b987440ea1c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1665484116860	1665484116860	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
73j3wx3hocpbxxc5wgrpxmusm4o	2022-10-11 10:28:36.872506+00	c4k4dqm7ixibc3ekbsptgi174ao	1	image		{"fileId":"77pe9r4ckbin438ph3f18bpatua.png"}	1665484116874	1665484116874	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
ay61uqe1u9jfg8ntzfyejdc1e4e	2022-10-11 10:28:36.886593+00	c4k4dqm7ixibc3ekbsptgi174ao	1	text	## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*	{}	1665484116889	1665484116889	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
vch8buek11i8zjrf4ro7uhh1nrr	2022-10-11 10:28:36.850179+00	b41kxw97cd7899ctkgswuoe811w	1	view	List: Tasks 🔨	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"50117d52-bcc7-4750-82aa-831a351c44a0":139,"__title":280},"defaultTemplateId":"","filter":{"filters":[{"condition":"includes","propertyId":"20717ad3-5741-4416-83f1-6f133fff3d11","values":["6eea96c9-4c61-4968-8554-4b7537e8f748"]}],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"50117d52-bcc7-4750-82aa-831a351c44a0","reversed":true}],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["50117d52-bcc7-4750-82aa-831a351c44a0","20717ad3-5741-4416-83f1-6f133fff3d11","60985f46-3e41-486e-8213-2b987440ea1c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1665484116852	1665484116852	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
vf5hjmyfy1iyb7gjory3uggzbdy	2022-10-11 10:28:36.865078+00	b41kxw97cd7899ctkgswuoe811w	1	view	List: Bugs 🐞	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"50117d52-bcc7-4750-82aa-831a351c44a0":145,"__title":280},"defaultTemplateId":"","filter":{"filters":[{"condition":"includes","propertyId":"20717ad3-5741-4416-83f1-6f133fff3d11","values":["1fdbb515-edd2-4af5-80fc-437ed2211a49"]}],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","reversed":false}],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["50117d52-bcc7-4750-82aa-831a351c44a0","20717ad3-5741-4416-83f1-6f133fff3d11","60985f46-3e41-486e-8213-2b987440ea1c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1665484116867	1665484116867	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
aewhyyg7pcbbd7euy4yhm4wyhio	2022-10-11 10:28:36.8798+00	c4k4dqm7ixibc3ekbsptgi174ao	1	text	## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*	{}	1665484116882	1665484116882	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
a7876syp5epd9dxprfjz6rbq6jo	2022-10-11 10:28:36.894402+00	cey7hpx5q8tyhzrrto7r7dnpiyy	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1665484116896	1665484116896	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
7xowaocwet3y48kqmwh3bh86a8h	2022-10-11 10:28:36.910372+00	cfefgwjke6bbxpjpig618g9bpte	1	image		{"fileId":"7pbp4qg415pbstc6enzeicnu3qh.png"}	1665484116912	1665484116912	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
akapa6sd8i7no7y4777wck36ato	2022-10-11 10:28:36.924854+00	cfefgwjke6bbxpjpig618g9bpte	1	text	## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\nA clear and concise description of what you expected to happen.\n\n## Edition and Platform\n\n - Edition: Personal Desktop / Personal Server / Mattermost plugin\n - Version: [e.g. v0.9.0]\n - Browser and OS: [e.g. Chrome 91 on macOS, Edge 93 on Windows]\n\n## Additional context\n\nAdd any other context about the problem here.	{}	1665484116927	1665484116927	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
ahp7i9y5843riuetuq1bd31qwsc	2022-10-11 10:28:36.940829+00	cnpwidyuyb7yytbk7c7wpt3hixe	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1665484116943	1665484116943	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
a9dp5yjhinig6tgebpa94mrsjga	2022-10-11 10:28:36.95594+00	cidz4imnqhir48brz6e8hxhfrhy	1	text	## Requirements\n- [Requirement 1]\n- [Requirement 2]\n- ...	{}	1665484116958	1665484116958	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
718jef5t65j8zxxnskjc9g8z85o	2022-10-11 10:28:36.969607+00	ccti3h7zsxigppxafizydxqqr9h	1	image		{"fileId":"7pbp4qg415pbstc6enzeicnu3qh.png"}	1665484116971	1665484116971	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
awuokcnksjjbh5b6oaspgixncqo	2022-10-11 10:28:36.983927+00	ccti3h7zsxigppxafizydxqqr9h	1	text	## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*	{}	1665484116986	1665484116986	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
a9qtx8yq5ifrcdkxtj4wgfqif7y	2022-10-11 10:28:36.998218+00	cwrq9ag3p5pgzzy98nfd3wwra1w	1	text	## Summary\n[Brief description of what this epic is about]\n\n## Motivation\n[Brief description on why this is needed]\n\n## Acceptance Criteria\n - [Criteron 1]\n - [Criteron 2]\n - ...\n\n## Personas\n - [Persona A]\n - [Persona B]\n - ...\n\n## Reference Materials\n - [Links to other relevant documents as needed]\n - ...	{}	1665484117000	1665484117000	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
ckuh9ftjhtpbbxbhe95ymqkq85c	2022-10-11 10:28:37.04213+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Drag cards	{"contentOrder":["apktbgtee5jb8xrnqy3ibiujxew","aq5ytc3po13fudyq6bbjm8d3ahe"],"icon":"🤏","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#dragging-cards","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1665484117044	1665484117044	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
cqz3o1wudajf93d8naeadh3yjme	2022-10-11 10:28:37.056334+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Create your own board	{"contentOrder":["a3bz37jponjgpunmzbch7in9w1w","a9se59c449jrhzm43bnsuhkw9ya","7r9my1yuddbn45dojrfht3neg8c","7eir5gdjxgjbsxpbyp3df4npcze","75m7g7abkc7gfpfrfayuwk7u5ey"],"icon":"📋","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-boards","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"amm6wfhnbuxojwssyftgs9dipqe","acypkejeb5yfujhj9te57p9kaxw":"aanaehcw3m13jytujsjk5hpf6ry"}}	1665484117058	1665484117058	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
czfmkmwczt7bi8e6o73m7wp874y	2022-10-11 10:28:37.071297+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Create a new card	{"contentOrder":["abmhoj7ud6tf3zgphbcaaqaisbw","adhsx4h5ss7rqdcjt8xyam6xtqc","aupxac94k3pnezrmorqd3f43eno","7me9p46gbqiyfmfnapi7dyxb5br","79e9x9r9h4jn9mxp9rth68casga"],"icon":"📝","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#adding-cards","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"amm6wfhnbuxojwssyftgs9dipqe","acypkejeb5yfujhj9te57p9kaxw":"aanaehcw3m13jytujsjk5hpf6ry"}}	1665484117073	1665484117073	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
cxjthfrkca3ybdpg3x4yc3n47ro	2022-10-11 10:28:37.086435+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Filter and sort cards	{"contentOrder":["a4fz9kcfs9ibj8puk9mux7ac94c","ay36inrifupg5jenxk1gpxsf1pc","78i8aqjmqtibr7x4okhz6uqquqr","7ciy7wejextbuzcgbnwqo4kcygo"],"icon":"🎛️","isTemplate":false,"properties":{"a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1665484117089	1665484117089	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
a4hewy143x3d9fk8faaxwhbn9xa	2022-10-11 10:28:36.991077+00	cwrq9ag3p5pgzzy98nfd3wwra1w	1	text	## Summary\n*[Brief description of what this epic is about]*\n## Motivation\n*[Brief description on why this is needed]*\n## Acceptance Criteria\n- *[Criteron 1]*\n- *[Criteron 2]*\n- ...\n## Personas\n- *[Persona A]*\n- *[Persona B]*\n- ...\n## Reference Materials\n- *[Links to other relevant documents as needed]*\n- ...	{}	1665484116993	1665484116993	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
byqqfpiy7ofye9xwposybdcne9w	2022-10-11 10:28:37.03438+00		1	board	Welcome to Boards!	{"cardProperties":[{"id":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","name":"Status","options":[{"color":"propColorRed","id":"amm6wfhnbuxojwssyftgs9dipqe","value":"To do 🔥"},{"color":"propColorYellow","id":"af3p8ztcyxgn8wd9z4az7o9tjeh","value":"Next up"},{"color":"propColorPurple","id":"ajurey3xkocs1nwx8di5zx6oe7o","value":"Later"},{"color":"propColorGreen","id":"agkinkjy5983wsk6kppsujajxqw","value":"Completed 🙌"}],"type":"select"},{"id":"acypkejeb5yfujhj9te57p9kaxw","name":"Priority","options":[{"color":"propColorOrange","id":"aanaehcw3m13jytujsjk5hpf6ry","value":"1. High"},{"color":"propColorBrown","id":"ascd7nm9r491ayot8i86g1gmgqw","value":"2. Medium"},{"color":"propColorGray","id":"aq6ukoiciyfctgwyhwzpfss8ghe","value":"3. Low"}],"type":"select"},{"id":"aqh13jabwexjkzr3jqsz1i1syew","name":"Assignee","options":[],"type":"person"},{"id":"acmg7mz1rr1eykfug4hcdpb1y1o","name":"Due Date","options":[],"type":"date"},{"id":"amewjwfjrtpu8ha73xsrdmxazxr","name":"Reviewed","options":[],"type":"checkbox"},{"id":"attzzboqaz6m1sdti5xa7gjnk1e","name":"Last updated time","options":[],"type":"updatedTime"},{"id":"a4nfnb5xr3txr5xq7y9ho7kyz6c","name":"Reference","options":[],"type":"url"},{"id":"a9gzwi3dt5n55nddej6zcbhxaeh","name":"Created by","options":[],"type":"createdBy"}],"description":"Mattermost Boards is an open source project management tool that helps you organize, track, and manage work across teams. Select a card to learn more.","icon":"👋","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"65aba997282f3ac457cd66736fb86915"}	1665484117037	1665484117037	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
cr9iyxt9hetrcibr8u33zxjbqcw	2022-10-11 10:28:37.049248+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Manage tasks with cards	{"contentOrder":["aad84aec6apdwzqh6hiuehenyay","7br1nnoptm7fxdd8yqu3zo9wexh","7hqpsp63zfifdm8kr7djioy4jrh","784uu3ufcgb878ky7hyugmf6xcw","78c5eda8cbibhbb1pty316j6quy","7hhckzt5i67bn9n44r54chrpiey","7ftwphgbimffjbc543uxgitjoje","7nb8y7jyoetro8cd36qcju53z8c","7tfrdm5nqfjbq7jjc8uio9aquew","7pr3t3kuuhiddieftuc5oiw4siw","76nwb9tqfsid5jx46yw34itqima","7dy3mcgzgybf1ifa3emgewkzj7e","a5ca6tii33bfw8ba36y1rswq3he","7876od6xhffr6fy69zeogag7eyw","7x7bq9awkatbm5x4docbh5gaw4y","7ghpx9qff43dgtke1rwidmge1ho","7nb8y7jyoetro8cd36qcju53z8c","7hdyxemhbytfm3m83g88djq9nhr","7pgnejxokubbe9kdrxj6g9qa41e","7hw9z6qtx8jyizkmm9g5yq3gxcy","7gk6ooz6npbb8by5rgp9aig7tua","7adxr5gwg8jfzjd1jo8rjq3kgtw"],"icon":"☑️","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"amm6wfhnbuxojwssyftgs9dipqe","acypkejeb5yfujhj9te57p9kaxw":"aanaehcw3m13jytujsjk5hpf6ry"}}	1665484117051	1665484117051	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
c74wyzodn1tn9jgbs4ydzmeijpc	2022-10-11 10:28:37.063944+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Share a board	{"contentOrder":["a1kx15ffj5fr5zdoxfoaztoo6mr","abt4rhu1wet8qtyq3rcqqkm645e","7r7asyew8d7fyunf4sow8e5iyoc","ad8j3n8tp77bppee3ipjt6odgpe","7w935usqt6pby8qz9x5pxaj7iow","7ogbs8h6q4j8z7ngy1m7eag63nw","7z1jau5qy3jfcxdp5cgq3duk6ne","7e553jp3c57bjugt645jr3ba5oe"],"icon":"📤","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/sharing-boards.html","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1665484117066	1665484117066	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
cnwpqrezw5fdidy55qeyx184rnh	2022-10-11 10:28:37.078504+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Share cards on Channels	{"contentOrder":["a3ftohdqo6iyzppe8jejzzbda9o","acdc7g8ddtfd1mjychhggr79g5o","acqdpt77s47nmxkqojrr3a4ri1y","7wc8fd9957iro7x4dtikxgpmyxa"],"icon":"📮","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html#share-card-previews","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"af3p8ztcyxgn8wd9z4az7o9tjeh","acypkejeb5yfujhj9te57p9kaxw":"ascd7nm9r491ayot8i86g1gmgqw"}}	1665484117081	1665484117081	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
ci5f44d3n4pn9tfgey3pnd66k3a	2022-10-11 10:28:37.094106+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Create a new view	{"contentOrder":["aozbezukpgif3jpbsq7tahmmp5e","aaxu6d9kxybg178ij5zqpx58ady","7owai1ux3h3gtf8byynfk6hyx1c","7n8jq1dizyfgotby3o91arf1hxh","77y4wffj1ctg7xmm9bx45qn6q6o","7uo89x8pyg3bgj8jtxyd5uwfkua"],"icon":"👓","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-views","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"af3p8ztcyxgn8wd9z4az7o9tjeh","acypkejeb5yfujhj9te57p9kaxw":"ascd7nm9r491ayot8i86g1gmgqw"}}	1665484117096	1665484117096	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
cmfp91m37e38sdf9rbw698mqr9y	2022-10-11 10:28:37.108748+00	byqqfpiy7ofye9xwposybdcne9w	1	card	@mention teammates	{"contentOrder":["adewfwnr5b3fb5mofxz43c9urha","an8q8ombf6t8zfydkzo9km43hoe","7mbw9t71hjbrydgzgkqqaoh8usr","7obfpazf9xigi9y8b83f1h84znh"],"icon":"🔔","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html#mention-people","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1665484117111	1665484117111	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
v4qqur776z38tzm1iwmbug66kqc	2022-10-11 10:28:37.12303+00	byqqfpiy7ofye9xwposybdcne9w	1	view	Preview: Calendar View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"acmg7mz1rr1eykfug4hcdpb1y1o","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1665484117125	1665484117125	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
vf88pqim7ptdapk9p7emhyfq9ho	2022-10-11 10:28:37.138308+00	byqqfpiy7ofye9xwposybdcne9w	1	view	Onboarding	{"cardOrder":["czfmkmwczt7bi8e6o73m7wp874y","cr9iyxt9hetrcibr8u33zxjbqcw","cqz3o1wudajf93d8naeadh3yjme","cnwpqrezw5fdidy55qeyx184rnh","cy83mbaa7fj8dtbm31fkgdmc18c","ci5f44d3n4pn9tfgey3pnd66k3a","cmfp91m37e38sdf9rbw698mqr9y","ckuh9ftjhtpbbxbhe95ymqkq85c","c74wyzodn1tn9jgbs4ydzmeijpc","cxjthfrkca3ybdpg3x4yc3n47ro"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","hiddenOptionIds":[""],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["aqb5x3pt87dcc9stbk4ofodrpoy","a1mtm777bkagq3iuu7xo9b13qfr","auxbwzptiqzkii5r61uz3ndsy1r","aj9386k1bx8qwmepeuxg3b7z4pw"],"visiblePropertyIds":[]}	1665484117140	1665484117140	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
78c5eda8cbibhbb1pty316j6quy	2022-10-11 10:28:37.152821+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	Assign tasks to teammates	{"value":false}	1665484117155	1665484117155	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7hhckzt5i67bn9n44r54chrpiey	2022-10-11 10:28:37.167272+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	Add and update descriptions with Markdown	{"value":false}	1665484117169	1665484117169	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
cy83mbaa7fj8dtbm31fkgdmc18c	2022-10-11 10:28:37.101514+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Add new properties	{"contentOrder":["aegyio7cabbgg8e47afuqg9gtpe","ayhk11qsuz789fk8bqae4oz8mro","7gc3z8cf8rirgfyutwoke9nn6jy","76cinqnb6k3dzmfbm9fnc8eofny","7ssoad5exjffiicg78bimb9d1na"],"icon":"🏷️","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html#add-and-manage-properties","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"af3p8ztcyxgn8wd9z4az7o9tjeh","acypkejeb5yfujhj9te57p9kaxw":"ascd7nm9r491ayot8i86g1gmgqw"}}	1665484117103	1665484117103	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
vknonqwtmojy3fmzs7ine73gkuo	2022-10-11 10:28:37.115802+00	byqqfpiy7ofye9xwposybdcne9w	1	view	Preview: Table View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"__title":280,"a972dc7a-5f4c-45d2-8044-8c28c69717f1":100,"acypkejeb5yfujhj9te57p9kaxw":169},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["a972dc7a-5f4c-45d2-8044-8c28c69717f1","aqh13jabwexjkzr3jqsz1i1syew","acmg7mz1rr1eykfug4hcdpb1y1o","acypkejeb5yfujhj9te57p9kaxw"]}	1665484117118	1665484117118	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
vwuow7uzqbb86fx17gthhdaw37o	2022-10-11 10:28:37.130362+00	byqqfpiy7ofye9xwposybdcne9w	1	view	Preview: Gallery View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"gallery","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1665484117132	1665484117132	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
aq5ytc3po13fudyq6bbjm8d3ahe	2022-10-11 10:28:37.145573+00	ckuh9ftjhtpbbxbhe95ymqkq85c	1	text	Mattermost Boards makes it easy for you to update certain properties on cards through our drag and drop functionality. Simply drag this card from the **Later** column to the **Completed** column to automatically update the status and mark this task as complete.	{}	1665484117148	1665484117148	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7adxr5gwg8jfzjd1jo8rjq3kgtw	2022-10-11 10:28:37.159951+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	Create and manage checklists, like this one... :)	{"value":false}	1665484117162	1665484117162	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7tfrdm5nqfjbq7jjc8uio9aquew	2022-10-11 10:28:37.174592+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	Follow cards to get notified on the latest updates	{"value":false}	1665484117177	1665484117177	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7ftwphgbimffjbc543uxgitjoje	2022-10-11 10:28:37.189124+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	Provide feedback and ask questions via comments	{"value":false}	1665484117191	1665484117191	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7hqpsp63zfifdm8kr7djioy4jrh	2022-10-11 10:28:37.202738+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	Manage deadlines and milestones	{"value":false}	1665484117205	1665484117205	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
75m7g7abkc7gfpfrfayuwk7u5ey	2022-10-11 10:28:37.217179+00	cqz3o1wudajf93d8naeadh3yjme	1	image		{"fileId":"74uia99m9btr8peydw7oexn37tw.gif"}	1665484117219	1665484117219	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
a9se59c449jrhzm43bnsuhkw9ya	2022-10-11 10:28:37.231845+00	cqz3o1wudajf93d8naeadh3yjme	1	text	To create your own board, select the "+" on the top of the left hand sidebar. Choose from one of our standard templates and see how they can help you get started with your next project:\n\n- **Project Tasks**: Stay on top of your project tasks, track progress, and set priorities. \n- **Meeting Agenda**: Set your meeting agendas for recurring team meetings and 1:1s.\n- **Roadmap**: Plan your roadmap and manage your releases more efficiently.\n- **Personal Tasks**: Organize your life and track your personal tasks.\n- **Content Calendar**: Plan your editorial content, assign work, and track deadlines.\n- **Personal Goals**: Set and accomplish new personal goals and milestones.	{}	1665484117234	1665484117234	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
a1kx15ffj5fr5zdoxfoaztoo6mr	2022-10-11 10:28:37.246259+00	c74wyzodn1tn9jgbs4ydzmeijpc	1	text	Keep stakeholders and customers up-to-date on project progress by sharing your board.	{}	1665484117248	1665484117248	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
79e9x9r9h4jn9mxp9rth68casga	2022-10-11 10:28:37.261684+00	czfmkmwczt7bi8e6o73m7wp874y	1	image		{"fileId":"7iw4rxx7jj7bypmdotd9z469cyh.png"}	1665484117264	1665484117264	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
abmhoj7ud6tf3zgphbcaaqaisbw	2022-10-11 10:28:37.2755+00	czfmkmwczt7bi8e6o73m7wp874y	1	text	Mattermost Boards helps you manage and track all your project tasks with **Cards**.	{}	1665484117277	1665484117277	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
acqdpt77s47nmxkqojrr3a4ri1y	2022-10-11 10:28:37.289419+00	cnwpqrezw5fdidy55qeyx184rnh	1	text	After you've copied the link, paste it into any channel or Direct Message to share the card. A preview of the card will display within the channel with a link back to the card on Boards.	{}	1665484117291	1665484117291	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
a3ftohdqo6iyzppe8jejzzbda9o	2022-10-11 10:28:37.304095+00	cnwpqrezw5fdidy55qeyx184rnh	1	text	Cards can be linked and shared with teammates directly on Channels. Card previews are displayed when shared on Channels, so your team can discuss work items and get the relevant context without having to switch over to Boards.	{}	1665484117306	1665484117306	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
ay36inrifupg5jenxk1gpxsf1pc	2022-10-11 10:28:37.318817+00	cxjthfrkca3ybdpg3x4yc3n47ro	1	text	Organize and find the cards you're looking for with our filter, sort, and grouping options. From the Board header, you can quickly toggle on different properties, change the group display, set filters, and change how the cards are sorted.	{}	1665484117321	1665484117321	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
aaxu6d9kxybg178ij5zqpx58ady	2022-10-11 10:28:37.333637+00	ci5f44d3n4pn9tfgey3pnd66k3a	1	text	Views allow your team to visualize the same cards and data from different perspectives, so they can stay up-to-date in the way that works best for them. To add a new view, go to **Add a new view** from the view drop-down, then select from any of the following views:\n\n- **Board**: Adds a Kanban board, similar to this one, that allows your team to organize cards in swimlanes grouped by any property of your choosing. This view helps you visualize your project progress.\n- **Table**: Displays cards in a table format with rows and columns. Use this view to get an overview of all your project tasks. Easily view and compare the state of all properties across all cards without needing to open individual cards.\n- **Gallery**: Displays cards in a gallery format, so you can manage and organize cards with image attachments.\n- **Calendar**: Adds a calendar view to easily visualize your cards by dates and keep track of deadlines.	{}	1665484117336	1665484117335	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7pr3t3kuuhiddieftuc5oiw4siw	2022-10-11 10:28:37.19573+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	@mention teammates so they can follow, and collaborate on, comments and descriptions	{"value":false}	1665484117198	1665484117198	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
aad84aec6apdwzqh6hiuehenyay	2022-10-11 10:28:37.209972+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	text	Cards allow your entire team to manage and collaborate on a task in one place. Within a card, your team can:	{}	1665484117212	1665484117212	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
a3bz37jponjgpunmzbch7in9w1w	2022-10-11 10:28:37.224268+00	cqz3o1wudajf93d8naeadh3yjme	1	text	A board helps you manage your project, organize tasks, and collaborate with your team all in one place.	{}	1665484117226	1665484117226	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7e553jp3c57bjugt645jr3ba5oe	2022-10-11 10:28:37.239047+00	c74wyzodn1tn9jgbs4ydzmeijpc	1	image		{"fileId":"7knxbyuiedtdafcgmropgkrtybr.gif"}	1665484117241	1665484117241	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
abt4rhu1wet8qtyq3rcqqkm645e	2022-10-11 10:28:37.254354+00	c74wyzodn1tn9jgbs4ydzmeijpc	1	text	To share a board, select **Share** at the top right of the Board view. Copy the link to share the board internally with your team or generate public link that can be accessed by anyone externally.	{}	1665484117256	1665484117256	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
aupxac94k3pnezrmorqd3f43eno	2022-10-11 10:28:37.268876+00	czfmkmwczt7bi8e6o73m7wp874y	1	text	To create a new card, simply do any of the following:\n- Select "**New**" on the top right header\n- Select "**+ New**" below any column\n- Select "**+**" to the right of any columnn header	{}	1665484117271	1665484117271	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7wc8fd9957iro7x4dtikxgpmyxa	2022-10-11 10:28:37.282528+00	cnwpqrezw5fdidy55qeyx184rnh	1	image		{"fileId":"7ek6wbpp19jfoujs1goh6kttbby.gif"}	1665484117285	1665484117284	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
acdc7g8ddtfd1mjychhggr79g5o	2022-10-11 10:28:37.29639+00	cnwpqrezw5fdidy55qeyx184rnh	1	text	To share a card, you'll need to copy the card link first. You can:\n\n- Open a card and select the options menu button at the top right of the card.\n- Open the board view and hover your mouse over any card to access the options menu button.	{}	1665484117299	1665484117298	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7ciy7wejextbuzcgbnwqo4kcygo	2022-10-11 10:28:37.31138+00	cxjthfrkca3ybdpg3x4yc3n47ro	1	image		{"fileId":"7dybb6t8fj3nrdft7nerhuf784y.png"}	1665484117313	1665484117313	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7uo89x8pyg3bgj8jtxyd5uwfkua	2022-10-11 10:28:37.326187+00	ci5f44d3n4pn9tfgey3pnd66k3a	1	image		{"fileId":"78jws5m1myf8pufewzkaa6i11sc.gif"}	1665484117328	1665484117328	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7ssoad5exjffiicg78bimb9d1na	2022-10-11 10:28:37.340976+00	cy83mbaa7fj8dtbm31fkgdmc18c	1	image		{"fileId":"7d6hrtig3zt8f9cnbo1um5oxx3y.gif"}	1665484117343	1665484117343	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7obfpazf9xigi9y8b83f1h84znh	2022-10-11 10:28:37.35512+00	cmfp91m37e38sdf9rbw698mqr9y	1	image		{"fileId":"74nt9eqzea3ydjjpgjtsxcjgrxc.gif"}	1665484117357	1665484117357	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
adewfwnr5b3fb5mofxz43c9urha	2022-10-11 10:28:37.369321+00	cmfp91m37e38sdf9rbw698mqr9y	1	text	Collaborate with teammates directly on each card using @mentions and have all the relevant context in one place.	{}	1665484117371	1665484117371	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
aegyio7cabbgg8e47afuqg9gtpe	2022-10-11 10:28:37.348295+00	cy83mbaa7fj8dtbm31fkgdmc18c	1	text	Customize cards to fit your needs and track the information most important to you. Boards supports a wide range of fully customizable property types. For example, you can:\n- Use the **Date** property for things like deadlines or milestones.\n- Assign owners to tasks with the **Person** property.\n- Define statuses and priorities with the **Select** property.\n- Create tags with the **Multi Select** property.\n- Link cards to webpages with the **URL** property.	{}	1665484117350	1665484117350	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
an8q8ombf6t8zfydkzo9km43hoe	2022-10-11 10:28:37.362316+00	cmfp91m37e38sdf9rbw698mqr9y	1	text	To mention a teammate use the **@ symbol with their username** in the comments or description section. They'll get a Direct Message notification via Channels and also be added as a [follower](https://docs.mattermost.com/boards/work-with-cards.html#receive-updates) to the card. \n\nWhenever any changes are made to the card, they'll automatically get notified on Channels.	{}	1665484117364	1665484117364	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
\.


--
-- Data for Name: focalboard_blocks_history; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_blocks_history (id, insert_at, parent_id, schema, type, title, fields, create_at, update_at, delete_at, root_id, modified_by, workspace_id, created_by) FROM stdin;
bm97xx5er7bfbjkfoh7m34i9d5e	2022-10-11 10:28:35.649711+00		1	board	Meeting Agenda 	{"cardProperties":[{"id":"d777ba3b-8728-40d1-87a6-59406bbbbfb0","name":"Status","options":[{"color":"propColorPink","id":"34eb9c25-d5bf-49d9-859e-f74f4e0030e7","value":"To Discuss 💬"},{"color":"propColorYellow","id":"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed","value":"Revisit Later ⏳"},{"color":"propColorGreen","id":"dabadd9b-adf1-4d9f-8702-805ac6cef602","value":"Done / Archived 📦"}],"type":"select"},{"id":"4cf1568d-530f-4028-8ffd-bdc65249187e","name":"Priority","options":[{"color":"propColorRed","id":"8b05c83e-a44a-4d04-831e-97f01d8e2003","value":"1. High"},{"color":"propColorYellow","id":"b1abafbf-a038-4a19-8b68-56e0fd2319f7","value":"2. Medium"},{"color":"propColorGray","id":"2491ffaa-eb55-417b-8aff-4bd7d4136613","value":"3. Low"}],"type":"select"},{"id":"aw4w63xhet79y9gueqzzeiifdoe","name":"Created by","options":[],"type":"createdBy"},{"id":"a6ux19353xcwfqg9k1inqg5sg4w","name":"Created time","options":[],"type":"createdTime"}],"description":"Use this template for recurring meeting agendas, like team meetings and 1:1's. To use this board:\\n* Participants queue new items to discuss under \\"To Discuss\\"\\n* Go through items during the meeting\\n* Move items to Done or Revisit Later as needed","icon":"🍩","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"54fcf9c610f0ac5e4c522c0657c90602"}	1665484115652	1665484115652	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
cq4rrd88wuj8zz8ya97nikruyth	2022-10-11 10:28:35.661998+00	bm97xx5er7bfbjkfoh7m34i9d5e	1	card	Team Schedule	{"contentOrder":["awntr8r8tb3y5u8xt4ooekpf4kr","78bizssm163bcxk7d8a5c1zmfoy","ax5d1oi94wirjjcbx5q3edm7zna","7yo3xsok4w7dhdxog9q9xsbwrsc","75axfqqjt1tnh9noek3sbnpf3hw","78a79ed3fqi8y3bkfxy798xbhpy"],"icon":"⏰","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"8b05c83e-a44a-4d04-831e-97f01d8e2003","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"34eb9c25-d5bf-49d9-859e-f74f4e0030e7"}}	1665484115665	1665484115664	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
ckbkffq8u6bd8uqpnfds3nx9zcw	2022-10-11 10:28:35.669744+00	bm97xx5er7bfbjkfoh7m34i9d5e	1	card	Video production	{"contentOrder":["aiic17pgx1bn7jkb6rp8qgj9yee","7m1a1g8tbm7gd5phdq1g71mjyac","aywutqt85hife8ks8uo5u7c41ar","78qd6sohre7n43dfo7h1ezy1suw","7xu9m347rppfzzd871s6uzgkpye","79mkdd7o3y3yhxkho9e51pgfpsw"],"icon":"📹","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"b1abafbf-a038-4a19-8b68-56e0fd2319f7","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"34eb9c25-d5bf-49d9-859e-f74f4e0030e7"}}	1665484115672	1665484115672	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
cgesjsttm63nypk4dhjawo78hke	2022-10-11 10:28:35.676958+00	bm97xx5er7bfbjkfoh7m34i9d5e	1	card	Offsite plans	{"contentOrder":["ayb7dzwjpofdbzf9r8igj4ngc4o","7pn9epcr1zfyp9gp1smmaks6cxr","a17azcxm3ctybpfjnpswne7mjow","7zunhku5nh3gspggwp83sbrgsfo","7izxeysn1i3djf8ob5ohn1nmzhc","7ozdc8muaq3gwjjkum6dg1p637a"],"icon":"🚙","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"8b05c83e-a44a-4d04-831e-97f01d8e2003","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"dabadd9b-adf1-4d9f-8702-805ac6cef602"}}	1665484115679	1665484115679	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
cr76dgiqek3f37btmgnxuu3wc1a	2022-10-11 10:28:35.683856+00	bm97xx5er7bfbjkfoh7m34i9d5e	1	card	Social Media Strategy	{"contentOrder":["auzp99fzqqjdg7r6dybdqdy4psc","7p5yz4gm4m7gi3khuspukez7mie","akudz7j3h43yn3gmtatd149sd3o","7ghj8qw39x78jxq6kjua4f6oxjw","7ndqtnco67tfybgcq998ioqqrmh","7cpzeu5rjip8e8xtydgjfkrexre"],"icon":"🎉","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"b1abafbf-a038-4a19-8b68-56e0fd2319f7","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed"}}	1665484115686	1665484115686	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
v4i1ygjyx3bgjxq5astyymd13za	2022-10-11 10:28:35.691105+00	bm97xx5er7bfbjkfoh7m34i9d5e	1	view	Discussion Items	{"cardOrder":["cjpkiya33qsagr4f9hrdwhgiajc"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"ch798q5ucefyobf5bymgqjt4f3h","filter":{"filters":[],"operation":"and"},"groupById":"d777ba3b-8728-40d1-87a6-59406bbbbfb0","hiddenOptionIds":[""],"kanbanCalculations":{},"sortOptions":[{"propertyId":"4cf1568d-530f-4028-8ffd-bdc65249187e","reversed":false}],"viewType":"board","visibleOptionIds":[],"visiblePropertyIds":["4cf1568d-530f-4028-8ffd-bdc65249187e"]}	1665484115693	1665484115693	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
75axfqqjt1tnh9noek3sbnpf3hw	2022-10-11 10:28:35.698457+00	cq4rrd88wuj8zz8ya97nikruyth	1	checkbox		{"value":false}	1665484115701	1665484115701	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7yo3xsok4w7dhdxog9q9xsbwrsc	2022-10-11 10:28:35.706254+00	cq4rrd88wuj8zz8ya97nikruyth	1	checkbox		{"value":false}	1665484115710	1665484115710	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
78bizssm163bcxk7d8a5c1zmfoy	2022-10-11 10:28:35.715552+00	cq4rrd88wuj8zz8ya97nikruyth	1	divider		{}	1665484115717	1665484115717	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
78a79ed3fqi8y3bkfxy798xbhpy	2022-10-11 10:28:35.722426+00	cq4rrd88wuj8zz8ya97nikruyth	1	checkbox		{"value":false}	1665484115724	1665484115724	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
awntr8r8tb3y5u8xt4ooekpf4kr	2022-10-11 10:28:35.729231+00	cq4rrd88wuj8zz8ya97nikruyth	1	text	## Notes\n*[Add meeting notes here]*	{}	1665484115731	1665484115731	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
ax5d1oi94wirjjcbx5q3edm7zna	2022-10-11 10:28:35.73645+00	cq4rrd88wuj8zz8ya97nikruyth	1	text	## Action Items	{}	1665484115739	1665484115739	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
74umemi8b37yibmbeyuo6mikj4w	2022-10-11 10:28:35.744404+00	ch798q5ucefyobf5bymgqjt4f3h	1	divider		{}	1665484115746	1665484115746	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
76fq4fuycnfycpyx6szdkwukjsr	2022-10-11 10:28:35.751486+00	ch798q5ucefyobf5bymgqjt4f3h	1	checkbox		{"value":false}	1665484115753	1665484115753	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7fows8dsk5jbt5q8qfa6q9qzhir	2022-10-11 10:28:35.758449+00	ch798q5ucefyobf5bymgqjt4f3h	1	checkbox		{"value":false}	1665484115760	1665484115760	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7qomzu99srpgidnpo6at6kdex8e	2022-10-11 10:28:35.76558+00	ch798q5ucefyobf5bymgqjt4f3h	1	checkbox		{"value":false}	1665484115768	1665484115768	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
au9rubtno7f8bzjb78wkr5uyy7r	2022-10-11 10:28:35.77279+00	ch798q5ucefyobf5bymgqjt4f3h	1	text	# Action Items	{}	1665484115775	1665484115775	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
a87ro89f633gtzngxs66xjrysar	2022-10-11 10:28:35.780048+00	ch798q5ucefyobf5bymgqjt4f3h	1	text	# Notes\n*[Add meeting notes here]*	{}	1665484115782	1665484115782	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7m1a1g8tbm7gd5phdq1g71mjyac	2022-10-11 10:28:35.786988+00	ckbkffq8u6bd8uqpnfds3nx9zcw	1	divider		{}	1665484115789	1665484115789	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
79mkdd7o3y3yhxkho9e51pgfpsw	2022-10-11 10:28:35.794272+00	ckbkffq8u6bd8uqpnfds3nx9zcw	1	checkbox		{"value":false}	1665484115796	1665484115796	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7xu9m347rppfzzd871s6uzgkpye	2022-10-11 10:28:35.801281+00	ckbkffq8u6bd8uqpnfds3nx9zcw	1	checkbox		{"value":false}	1665484115803	1665484115803	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
78qd6sohre7n43dfo7h1ezy1suw	2022-10-11 10:28:35.808483+00	ckbkffq8u6bd8uqpnfds3nx9zcw	1	checkbox		{"value":false}	1665484115810	1665484115810	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
aywutqt85hife8ks8uo5u7c41ar	2022-10-11 10:28:35.816403+00	ckbkffq8u6bd8uqpnfds3nx9zcw	1	text	## Action Items	{}	1665484115818	1665484115818	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7zunhku5nh3gspggwp83sbrgsfo	2022-10-11 10:28:35.832198+00	cgesjsttm63nypk4dhjawo78hke	1	checkbox		{"value":false}	1665484115835	1665484115835	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7pn9epcr1zfyp9gp1smmaks6cxr	2022-10-11 10:28:35.846969+00	cgesjsttm63nypk4dhjawo78hke	1	divider		{}	1665484115849	1665484115849	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
a17azcxm3ctybpfjnpswne7mjow	2022-10-11 10:28:35.861185+00	cgesjsttm63nypk4dhjawo78hke	1	text	## Action Items	{}	1665484115863	1665484115863	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7p5yz4gm4m7gi3khuspukez7mie	2022-10-11 10:28:35.875911+00	cr76dgiqek3f37btmgnxuu3wc1a	1	divider		{}	1665484115878	1665484115878	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7cpzeu5rjip8e8xtydgjfkrexre	2022-10-11 10:28:35.890727+00	cr76dgiqek3f37btmgnxuu3wc1a	1	checkbox		{"value":false}	1665484115893	1665484115893	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
akudz7j3h43yn3gmtatd149sd3o	2022-10-11 10:28:35.904647+00	cr76dgiqek3f37btmgnxuu3wc1a	1	text	## Action Items	{}	1665484115906	1665484115906	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
bwqu47azc7prgxqayntpkjz9zse	2022-10-11 10:28:35.919313+00		1	board	Personal Tasks 	{"cardProperties":[{"id":"a9zf59u8x1rf4ywctpcqama7tio","name":"Occurrence","options":[{"color":"propColorBlue","id":"an51dnkenmoog9cetapbc4uyt3y","value":"Daily"},{"color":"propColorOrange","id":"afpy8s7i45frggprmfsqngsocqh","value":"Weekly"},{"color":"propColorPurple","id":"aj4jyekqqssatjcq7r7chmy19ey","value":"Monthly"}],"type":"select"},{"id":"abthng7baedhhtrwsdodeuincqy","name":"Completed","options":[],"type":"checkbox"}],"description":"Use this template to organize your life and track your personal tasks.","icon":"✔️","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"dfb70c146a4584b8a21837477c7b5431"}	1665484115921	1665484115921	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
csd55okshm7ftz8ju6nfb7f8pzo	2022-10-11 10:28:35.93254+00	bwqu47azc7prgxqayntpkjz9zse	1	card	Buy groceries	{"contentOrder":["at7o5i6a6eif8jyu46eji79htxo","7iezc4bhu7bg79nsjp4wq7m46qo","78r6qeb3nyjyz8rpn1u7cf48znh","7fqih5dhi83yspmbwi5ptufu3gw","78ayeymwqk3bmtnmqgoedgptgue","78a4ka9zhrfd9dykaqh4uqxynda","7e4qi6tioht859ccdykbnf3ytgr"],"icon":"🛒","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"afpy8s7i45frggprmfsqngsocqh"}}	1665484115934	1665484115934	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
ctr989gtk6typ8ezgzw7qkqoapw	2022-10-11 10:28:35.946843+00	bwqu47azc7prgxqayntpkjz9zse	1	card	Feed Fluffy	{"contentOrder":["abwz6he7bipy93ye9oqqutyjp1c"],"icon":"🐱","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"an51dnkenmoog9cetapbc4uyt3y"}}	1665484115949	1665484115949	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
vhsizpegix3fepnr4guby19h3qy	2022-10-11 10:28:35.962778+00	bwqu47azc7prgxqayntpkjz9zse	1	view	List View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"__title":280},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["a9zf59u8x1rf4ywctpcqama7tio","abthng7baedhhtrwsdodeuincqy"]}	1665484115965	1665484115965	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
7mfzzaeo5ipdamjmwnstddprsgy	2022-10-11 10:28:35.977234+00	c3s6yggmhkid8zyoxfun16ihfqy	1	checkbox	Utilities	{"value":true}	1665484115979	1665484115979	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
7parwz89rfty7me8be3s99jft7e	2022-10-11 10:28:35.992764+00	c3s6yggmhkid8zyoxfun16ihfqy	1	checkbox	Internet	{"value":true}	1665484115995	1665484115995	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
78ayeymwqk3bmtnmqgoedgptgue	2022-10-11 10:28:36.008079+00	csd55okshm7ftz8ju6nfb7f8pzo	1	checkbox	Butter	{"value":false}	1665484116010	1665484116010	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
7iezc4bhu7bg79nsjp4wq7m46qo	2022-10-11 10:28:36.022595+00	csd55okshm7ftz8ju6nfb7f8pzo	1	checkbox	Milk	{"value":false}	1665484116024	1665484116024	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
78r6qeb3nyjyz8rpn1u7cf48znh	2022-10-11 10:28:36.036787+00	csd55okshm7ftz8ju6nfb7f8pzo	1	checkbox	Eggs	{"value":false}	1665484116039	1665484116039	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
757pb6aqqi7gxbcr1n6nxehkg8w	2022-10-11 10:28:36.051313+00	ccbp74hwobfbd8yzi96peb3ngho	1	image		{"fileId":"76fwrj36hptg6dywka4k5mt3sph.png"}	1665484116053	1665484116053	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
aijsaob9cifyg9rqm1pu5a7wqah	2022-10-11 10:28:36.065639+00	ccbp74hwobfbd8yzi96peb3ngho	1	text	## Route	{}	1665484116068	1665484116068	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
b6cuu7ogc4pyeijcxh3anappg6y	2022-10-11 10:28:36.189186+00		1	board	Project Tasks 	{"cardProperties":[{"id":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","name":"Status","options":[{"color":"propColorBlue","id":"ayz81h9f3dwp7rzzbdebesc7ute","value":"Not Started"},{"color":"propColorYellow","id":"ar6b8m3jxr3asyxhr8iucdbo6yc","value":"In Progress"},{"color":"propColorRed","id":"afi4o5nhnqc3smtzs1hs3ij34dh","value":"Blocked"},{"color":"propColorGreen","id":"adeo5xuwne3qjue83fcozekz8ko","value":"Completed 🙌"},{"color":"propColorBrown","id":"ahpyxfnnrzynsw3im1psxpkgtpe","value":"Archived"}],"type":"select"},{"id":"d3d682bf-e074-49d9-8df5-7320921c2d23","name":"Priority","options":[{"color":"propColorRed","id":"d3bfb50f-f569-4bad-8a3a-dd15c3f60101","value":"1. High 🔥"},{"color":"propColorYellow","id":"87f59784-b859-4c24-8ebe-17c766e081dd","value":"2. Medium"},{"color":"propColorGray","id":"98a57627-0f76-471d-850d-91f3ed9fd213","value":"3. Low"}],"type":"select"},{"id":"axkhqa4jxr3jcqe4k87g8bhmary","name":"Assignee","options":[],"type":"person"},{"id":"a8daz81s4xjgke1ww6cwik5w7ye","name":"Estimated Hours","options":[],"type":"number"},{"id":"a3zsw7xs8sxy7atj8b6totp3mby","name":"Due Date","options":[],"type":"date"},{"id":"a7gdnz8ff8iyuqmzddjgmgo9ery","name":"Created By","options":[],"type":"createdBy"},{"id":"2a5da320-735c-4093-8787-f56e15cdfeed","name":"Date Created","options":[],"type":"createdTime"}],"description":"Use this template to stay on top of your project tasks and progress.","icon":"🎯","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"a4ec399ab4f2088b1051c3cdf1dde4c3"}	1665484116191	1665484116191	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
c6k1gzxcgjffg9pwoedi81pxgpo	2022-10-11 10:28:36.205268+00	b6cuu7ogc4pyeijcxh3anappg6y	1	card	Define project scope	{"contentOrder":["an79yua3fujfspjhgh898kbcyea","7zqpu5mw7ojn77e1txcm5313iho","ab6qh1ypdtbfsuenf33nzamg8zh","7gx789wt1ptgs9n9zqicwfys8xw","7up99ooneatfemqztr3ppz6c65a","7k85ozpk7qjy6mccicb9kuibw6r","7y5sm9gjd3jgbtx5qcueqmfhy9a"],"icon":"🔬","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"32","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ar6b8m3jxr3asyxhr8iucdbo6yc","d3d682bf-e074-49d9-8df5-7320921c2d23":"87f59784-b859-4c24-8ebe-17c766e081dd"}}	1665484116208	1665484116207	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
a5yqeyxuxypg97g85uo5ttq176e	2022-10-11 10:28:36.96301+00	cmtnbp3xc7ibzfbr34wcz9yzxcc	1	text	## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...	{}	1665484116965	1665484116965	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
aiic17pgx1bn7jkb6rp8qgj9yee	2022-10-11 10:28:35.824541+00	ckbkffq8u6bd8uqpnfds3nx9zcw	1	text	## Notes\n*[Add meeting notes here]*	{}	1665484115827	1665484115827	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7izxeysn1i3djf8ob5ohn1nmzhc	2022-10-11 10:28:35.840104+00	cgesjsttm63nypk4dhjawo78hke	1	checkbox		{"value":false}	1665484115842	1665484115842	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7ozdc8muaq3gwjjkum6dg1p637a	2022-10-11 10:28:35.854132+00	cgesjsttm63nypk4dhjawo78hke	1	checkbox		{"value":false}	1665484115856	1665484115856	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
ayb7dzwjpofdbzf9r8igj4ngc4o	2022-10-11 10:28:35.868637+00	cgesjsttm63nypk4dhjawo78hke	1	text	## Notes\n*[Add meeting notes here]*	{}	1665484115871	1665484115871	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7ndqtnco67tfybgcq998ioqqrmh	2022-10-11 10:28:35.883198+00	cr76dgiqek3f37btmgnxuu3wc1a	1	checkbox		{"value":false}	1665484115885	1665484115885	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
7ghj8qw39x78jxq6kjua4f6oxjw	2022-10-11 10:28:35.89759+00	cr76dgiqek3f37btmgnxuu3wc1a	1	checkbox		{"value":false}	1665484115899	1665484115899	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
auzp99fzqqjdg7r6dybdqdy4psc	2022-10-11 10:28:35.911561+00	cr76dgiqek3f37btmgnxuu3wc1a	1	text	## Notes\n*[Add meeting notes here]*	{}	1665484115913	1665484115913	0	bm97xx5er7bfbjkfoh7m34i9d5e	system	0	system
c3s6yggmhkid8zyoxfun16ihfqy	2022-10-11 10:28:35.925904+00	bwqu47azc7prgxqayntpkjz9zse	1	card	Pay bills	{"contentOrder":["7d6c9u7hgmjr7ikhms4fpegjbcy","7parwz89rfty7me8be3s99jft7e","7mfzzaeo5ipdamjmwnstddprsgy"],"icon":"🔌","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"aj4jyekqqssatjcq7r7chmy19ey","abthng7baedhhtrwsdodeuincqy":"true"}}	1665484115928	1665484115928	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
ccbp74hwobfbd8yzi96peb3ngho	2022-10-11 10:28:35.939086+00	bwqu47azc7prgxqayntpkjz9zse	1	card	Go for a walk	{"contentOrder":["arjebudzzuf8e7dnmh6xf6mjxqo","aijsaob9cifyg9rqm1pu5a7wqah","757pb6aqqi7gxbcr1n6nxehkg8w"],"icon":"👣","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"an51dnkenmoog9cetapbc4uyt3y"}}	1665484115941	1665484115941	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
ccextuyz5dbd8tx3mkpknw9j1xw	2022-10-11 10:28:35.955329+00	bwqu47azc7prgxqayntpkjz9zse	1	card	Gardening	{"contentOrder":[],"icon":"🌳","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"afpy8s7i45frggprmfsqngsocqh"}}	1665484115957	1665484115957	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
v4yofyoz3i7bs5n6ebxn3bbexeo	2022-10-11 10:28:35.969868+00	bwqu47azc7prgxqayntpkjz9zse	1	view	Board View	{"cardOrder":["csd55okshm7ftz8ju6nfb7f8pzo","c3s6yggmhkid8zyoxfun16ihfqy","ccbp74hwobfbd8yzi96peb3ngho","ctr989gtk6typ8ezgzw7qkqoapw","czowhma7rnpgb3eczbqo3t7fijo"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cidrrzojxpfroicutox1hoyk91h","filter":{"filters":[],"operation":"and"},"groupById":"a9zf59u8x1rf4ywctpcqama7tio","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["an51dnkenmoog9cetapbc4uyt3y","afpy8s7i45frggprmfsqngsocqh","aj4jyekqqssatjcq7r7chmy19ey",""],"visiblePropertyIds":["a9zf59u8x1rf4ywctpcqama7tio"]}	1665484115972	1665484115972	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
7d6c9u7hgmjr7ikhms4fpegjbcy	2022-10-11 10:28:35.984777+00	c3s6yggmhkid8zyoxfun16ihfqy	1	checkbox	Mobile phone	{"value":true}	1665484115987	1665484115987	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
78a4ka9zhrfd9dykaqh4uqxynda	2022-10-11 10:28:36.000637+00	csd55okshm7ftz8ju6nfb7f8pzo	1	checkbox	Cereal	{"value":false}	1665484116003	1665484116003	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
7fqih5dhi83yspmbwi5ptufu3gw	2022-10-11 10:28:36.015402+00	csd55okshm7ftz8ju6nfb7f8pzo	1	checkbox	Bread	{"value":false}	1665484116017	1665484116017	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
7e4qi6tioht859ccdykbnf3ytgr	2022-10-11 10:28:36.029619+00	csd55okshm7ftz8ju6nfb7f8pzo	1	checkbox	Bananas	{"value":false}	1665484116032	1665484116032	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
at7o5i6a6eif8jyu46eji79htxo	2022-10-11 10:28:36.043929+00	csd55okshm7ftz8ju6nfb7f8pzo	1	text	## Grocery list	{}	1665484116046	1665484116046	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
arjebudzzuf8e7dnmh6xf6mjxqo	2022-10-11 10:28:36.058266+00	ccbp74hwobfbd8yzi96peb3ngho	1	text	## Goal\nWalk at least 10,000 steps every day.	{}	1665484116060	1665484116060	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
abwz6he7bipy93ye9oqqutyjp1c	2022-10-11 10:28:36.078015+00	ctr989gtk6typ8ezgzw7qkqoapw	1	text		{}	1665484116080	1665484116080	0	bwqu47azc7prgxqayntpkjz9zse	system	0	system
chbe1ody1p7gudm8nf4qmprypeh	2022-10-11 10:28:36.198302+00	b6cuu7ogc4pyeijcxh3anappg6y	1	card	Identify dependencies	{"contentOrder":["a7yxbb4kusp8ztdh15af89shgee","7kx86itgmjbrymnz6goq1bzd1fc","aj77myg5oqfyjjkc9fsk7f9u4dr","75k5m8qwis3r63p1azw9zuitjhy","74qtwt7fag7gzpbgcbbxgu5kwjc","7gwdu5yphdpbu9jos3k3es154go","7q1yitzpo4bgsmc848dbsrw683h"],"icon":"🔗","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"16","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ayz81h9f3dwp7rzzbdebesc7ute","d3d682bf-e074-49d9-8df5-7320921c2d23":"98a57627-0f76-471d-850d-91f3ed9fd213"}}	1665484116200	1665484116200	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
cmbngfj16pfnzij6six8ak7pjqh	2022-10-11 10:28:36.212848+00	b6cuu7ogc4pyeijcxh3anappg6y	1	card	Requirements sign-off	{"contentOrder":["a5uodhfjkg7rpixif8pt1uk88to","7u75uuudybpnrdxuy46azw8cter","aen75btdasbyk3f6bi836bccs8w","7fuu6x5fzo7rnjko1c6i65aj3ka","7cofo45wksif45kjobmfh5g3mzo","7msb5wjtwgtnrxkdf79oe8o6roo","7f3nzbsh7d3fe9rs88iub16az3o"],"icon":"🖋️","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"8","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ayz81h9f3dwp7rzzbdebesc7ute","d3d682bf-e074-49d9-8df5-7320921c2d23":"d3bfb50f-f569-4bad-8a3a-dd15c3f60101"}}	1665484116215	1665484116215	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
ctrr4h3o11jyzjkhimwp13q5rur	2022-10-11 10:28:36.2277+00	b6cuu7ogc4pyeijcxh3anappg6y	1	card	Conduct market analysis	{"contentOrder":["aeio17fupd3d3fxgmpmbts14khr","768d5mwnwntbb8qjn4ufdgf8few","atyiojfpbbfdifdkffkfumdxd7o","7kmunyiqyyp8ftqy3sr3x9azfzr","7yugrg7yb9fyuxxhn9oasy4ufxr","77a85z5y697fqtpaiuggu5bog6w","749pbj8jf97dhbkugh4ni6atrkw"],"icon":"📈","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"40","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ar6b8m3jxr3asyxhr8iucdbo6yc","d3d682bf-e074-49d9-8df5-7320921c2d23":"87f59784-b859-4c24-8ebe-17c766e081dd"}}	1665484116230	1665484116230	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
vh7ptebnww7nkpfsex4nuku4b7r	2022-10-11 10:28:36.608387+00	bxgo46mjubbr53q3m9qzphodsiy	1	view	By Status	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"af6fcbb8-ca56-4b73-83eb-37437b9a667d","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","77c539af-309c-4db1-8329-d20ef7e9eacd","98bdea27-0cce-4cde-8dc6-212add36e63a",""],"visiblePropertyIds":["d9725d14-d5a8-48e5-8de1-6f8c004a9680","d6b1249b-bc18-45fc-889e-bec48fce80ef"]}	1665484116611	1665484116610	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
agmbibza1ztrxibzidaq9k7os5r	2022-10-11 10:28:36.976659+00	ccti3h7zsxigppxafizydxqqr9h	1	text	## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*	{}	1665484116979	1665484116979	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
c8xewtyxeo3ysprnqed7d6go3aa	2022-10-11 10:28:36.220158+00	b6cuu7ogc4pyeijcxh3anappg6y	1	card	Project budget approval	{"contentOrder":["afsh8qrpkn3giip7t4shmgu9q6e","76b5d64urebdxdky1upt9xqd5io","a9hsepangsjbp3mtbg436biey5e","71niyx53dwjb15jwg1ostndq9oy","733zbgfx9rprzzghddf6wk79bmo","7fiatgq91hirz7fm6hi8rjrne4e","7d7wyxfhbbbrobge5eg63h6owxr"],"icon":"💵","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"16","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ayz81h9f3dwp7rzzbdebesc7ute","d3d682bf-e074-49d9-8df5-7320921c2d23":"d3bfb50f-f569-4bad-8a3a-dd15c3f60101"}}	1665484116222	1665484116222	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
ve5y91we9xjdhdqkfw9dzsdrjgo	2022-10-11 10:28:36.234863+00	b6cuu7ogc4pyeijcxh3anappg6y	1	view	Project Priorities	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"d3d682bf-e074-49d9-8df5-7320921c2d23","hiddenOptionIds":[],"kanbanCalculations":{"":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"87f59784-b859-4c24-8ebe-17c766e081dd":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"98a57627-0f76-471d-850d-91f3ed9fd213":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"d3bfb50f-f569-4bad-8a3a-dd15c3f60101":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"}},"sortOptions":[],"viewType":"board","visibleOptionIds":["d3bfb50f-f569-4bad-8a3a-dd15c3f60101","87f59784-b859-4c24-8ebe-17c766e081dd","98a57627-0f76-471d-850d-91f3ed9fd213",""],"visiblePropertyIds":["a972dc7a-5f4c-45d2-8044-8c28c69717f1","a8daz81s4xjgke1ww6cwik5w7ye"]}	1665484116237	1665484116237	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
vx7pj46citpfs8dhf155rykgqxo	2022-10-11 10:28:36.25006+00	b6cuu7ogc4pyeijcxh3anappg6y	1	view	Task Overview	{"cardOrder":["c6k1gzxcgjffg9pwoedi81pxgpo","ctrr4h3o11jyzjkhimwp13q5rur","chbe1ody1p7gudm8nf4qmprypeh","c8xewtyxeo3ysprnqed7d6go3aa","cmbngfj16pfnzij6six8ak7pjqh","cz8p8gofakfby8kzz83j97db8ph","ce1jm5q5i54enhuu4h3kkay1hcc"],"collapsedOptionIds":[],"columnCalculations":{"a8daz81s4xjgke1ww6cwik5w7ye":"sum"},"columnWidths":{"2a5da320-735c-4093-8787-f56e15cdfeed":196,"__title":280,"a8daz81s4xjgke1ww6cwik5w7ye":139,"a972dc7a-5f4c-45d2-8044-8c28c69717f1":141,"d3d682bf-e074-49d9-8df5-7320921c2d23":110},"defaultTemplateId":"czw9es1e89fdpjr7cqptr1xq7qh","filter":{"filters":[],"operation":"and"},"groupById":"","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["a972dc7a-5f4c-45d2-8044-8c28c69717f1","d3d682bf-e074-49d9-8df5-7320921c2d23","2a5da320-735c-4093-8787-f56e15cdfeed","a3zsw7xs8sxy7atj8b6totp3mby","axkhqa4jxr3jcqe4k87g8bhmary","a7gdnz8ff8iyuqmzddjgmgo9ery","a8daz81s4xjgke1ww6cwik5w7ye"]}	1665484116252	1665484116252	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
75k5m8qwis3r63p1azw9zuitjhy	2022-10-11 10:28:36.264572+00	chbe1ody1p7gudm8nf4qmprypeh	1	checkbox	[Subtask 1]	{"value":false}	1665484116266	1665484116266	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7kx86itgmjbrymnz6goq1bzd1fc	2022-10-11 10:28:36.279064+00	chbe1ody1p7gudm8nf4qmprypeh	1	divider		{}	1665484116281	1665484116281	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7gwdu5yphdpbu9jos3k3es154go	2022-10-11 10:28:36.293453+00	chbe1ody1p7gudm8nf4qmprypeh	1	checkbox	[Subtask 3]	{"value":false}	1665484116295	1665484116295	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
a7yxbb4kusp8ztdh15af89shgee	2022-10-11 10:28:36.307989+00	chbe1ody1p7gudm8nf4qmprypeh	1	text	## Description\n*[Brief description of this task]*	{}	1665484116310	1665484116310	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7y5sm9gjd3jgbtx5qcueqmfhy9a	2022-10-11 10:28:36.322496+00	c6k1gzxcgjffg9pwoedi81pxgpo	1	checkbox	...	{"value":false}	1665484116324	1665484116324	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7k85ozpk7qjy6mccicb9kuibw6r	2022-10-11 10:28:36.336885+00	c6k1gzxcgjffg9pwoedi81pxgpo	1	checkbox	[Subtask 3]	{"value":false}	1665484116339	1665484116339	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
ab6qh1ypdtbfsuenf33nzamg8zh	2022-10-11 10:28:36.350967+00	c6k1gzxcgjffg9pwoedi81pxgpo	1	text	## Checklist	{}	1665484116353	1665484116353	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7f3nzbsh7d3fe9rs88iub16az3o	2022-10-11 10:28:36.364886+00	cmbngfj16pfnzij6six8ak7pjqh	1	checkbox	...	{"value":false}	1665484116367	1665484116367	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7u75uuudybpnrdxuy46azw8cter	2022-10-11 10:28:36.379046+00	cmbngfj16pfnzij6six8ak7pjqh	1	divider		{}	1665484116381	1665484116381	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7fuu6x5fzo7rnjko1c6i65aj3ka	2022-10-11 10:28:36.393995+00	cmbngfj16pfnzij6six8ak7pjqh	1	checkbox	[Subtask 1]	{"value":false}	1665484116396	1665484116396	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
aen75btdasbyk3f6bi836bccs8w	2022-10-11 10:28:36.407911+00	cmbngfj16pfnzij6six8ak7pjqh	1	text	## Checklist	{}	1665484116410	1665484116410	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
71niyx53dwjb15jwg1ostndq9oy	2022-10-11 10:28:36.422316+00	c8xewtyxeo3ysprnqed7d6go3aa	1	checkbox	[Subtask 1]	{"value":false}	1665484116424	1665484116424	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7d7wyxfhbbbrobge5eg63h6owxr	2022-10-11 10:28:36.436479+00	c8xewtyxeo3ysprnqed7d6go3aa	1	checkbox	...	{"value":false}	1665484116438	1665484116438	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
a9hsepangsjbp3mtbg436biey5e	2022-10-11 10:28:36.450609+00	c8xewtyxeo3ysprnqed7d6go3aa	1	text	## Checklist	{}	1665484116452	1665484116452	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
749pbj8jf97dhbkugh4ni6atrkw	2022-10-11 10:28:36.464984+00	ctrr4h3o11jyzjkhimwp13q5rur	1	checkbox	...	{"value":false}	1665484116467	1665484116467	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
768d5mwnwntbb8qjn4ufdgf8few	2022-10-11 10:28:36.479349+00	ctrr4h3o11jyzjkhimwp13q5rur	1	divider		{}	1665484116481	1665484116481	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7kmunyiqyyp8ftqy3sr3x9azfzr	2022-10-11 10:28:36.494045+00	ctrr4h3o11jyzjkhimwp13q5rur	1	checkbox	[Subtask 1]	{"value":false}	1665484116496	1665484116496	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
atyiojfpbbfdifdkffkfumdxd7o	2022-10-11 10:28:36.508625+00	ctrr4h3o11jyzjkhimwp13q5rur	1	text	## Checklist	{}	1665484116510	1665484116510	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7xgyuabsfkibpxfpf1dc3sutcqr	2022-10-11 10:28:36.523236+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	[Subtask 2]	{"value":false}	1665484116525	1665484116525	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7eptgw7s87pyepdpo4hnqx713ho	2022-10-11 10:28:36.53837+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	[Subtask 1]	{"value":false}	1665484116540	1665484116540	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
a9dyiic9fppnopr4okfj8zsf9dh	2022-10-11 10:28:36.554713+00	czw9es1e89fdpjr7cqptr1xq7qh	1	text	## Description\n*[Brief description of this task]*	{}	1665484116557	1665484116557	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
ank5cpbddh7dy8fxfkcjkd8sxqy	2022-10-11 10:28:36.902236+00	chtobgq1x63rbukyzq3et8dcnar	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1665484116904	1665484116904	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
apedp4m1mkp8ymxrtkqjo7exq9w	2022-10-11 10:28:36.917729+00	cfefgwjke6bbxpjpig618g9bpte	1	text	## Screenshots\nIf applicable, add screenshots to elaborate on the problem.	{}	1665484116920	1665484116920	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
vbax4x1grbfr1mfm8sdtpcq5dic	2022-10-11 10:28:36.24231+00	b6cuu7ogc4pyeijcxh3anappg6y	1	view	Progress Tracker	{"cardOrder":["c8xewtyxeo3ysprnqed7d6go3aa","cmbngfj16pfnzij6six8ak7pjqh","chbe1ody1p7gudm8nf4qmprypeh","ctrr4h3o11jyzjkhimwp13q5rur","c6k1gzxcgjffg9pwoedi81pxgpo","coxnjt3ro1in19dd1e3awdt338r"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"czw9es1e89fdpjr7cqptr1xq7qh","filter":{"filters":[],"operation":"and"},"groupById":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","hiddenOptionIds":[],"kanbanCalculations":{"":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"adeo5xuwne3qjue83fcozekz8ko":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"afi4o5nhnqc3smtzs1hs3ij34dh":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"ahpyxfnnrzynsw3im1psxpkgtpe":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"ar6b8m3jxr3asyxhr8iucdbo6yc":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"ayz81h9f3dwp7rzzbdebesc7ute":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"}},"sortOptions":[],"viewType":"board","visibleOptionIds":["ayz81h9f3dwp7rzzbdebesc7ute","ar6b8m3jxr3asyxhr8iucdbo6yc","afi4o5nhnqc3smtzs1hs3ij34dh","adeo5xuwne3qjue83fcozekz8ko","ahpyxfnnrzynsw3im1psxpkgtpe",""],"visiblePropertyIds":["d3d682bf-e074-49d9-8df5-7320921c2d23","a8daz81s4xjgke1ww6cwik5w7ye"]}	1665484116244	1665484116244	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
v5qafk1c6gtgepmus4kcok1uryr	2022-10-11 10:28:36.257483+00	b6cuu7ogc4pyeijcxh3anappg6y	1	view	Task Calendar	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"a3zsw7xs8sxy7atj8b6totp3mby","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1665484116259	1665484116259	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
74qtwt7fag7gzpbgcbbxgu5kwjc	2022-10-11 10:28:36.271763+00	chbe1ody1p7gudm8nf4qmprypeh	1	checkbox	[Subtask 2]	{"value":false}	1665484116274	1665484116274	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7q1yitzpo4bgsmc848dbsrw683h	2022-10-11 10:28:36.286144+00	chbe1ody1p7gudm8nf4qmprypeh	1	checkbox	...	{"value":false}	1665484116288	1665484116288	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
aj77myg5oqfyjjkc9fsk7f9u4dr	2022-10-11 10:28:36.300703+00	chbe1ody1p7gudm8nf4qmprypeh	1	text	## Checklist	{}	1665484116303	1665484116303	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7up99ooneatfemqztr3ppz6c65a	2022-10-11 10:28:36.315078+00	c6k1gzxcgjffg9pwoedi81pxgpo	1	checkbox	[Subtask 2]	{"value":false}	1665484116317	1665484116317	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7gx789wt1ptgs9n9zqicwfys8xw	2022-10-11 10:28:36.329622+00	c6k1gzxcgjffg9pwoedi81pxgpo	1	checkbox	[Subtask 1]	{"value":false}	1665484116332	1665484116332	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7zqpu5mw7ojn77e1txcm5313iho	2022-10-11 10:28:36.343855+00	c6k1gzxcgjffg9pwoedi81pxgpo	1	divider		{}	1665484116346	1665484116346	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
an79yua3fujfspjhgh898kbcyea	2022-10-11 10:28:36.358055+00	c6k1gzxcgjffg9pwoedi81pxgpo	1	text	## Description\n*[Brief description of this task]*	{}	1665484116360	1665484116360	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7cofo45wksif45kjobmfh5g3mzo	2022-10-11 10:28:36.371865+00	cmbngfj16pfnzij6six8ak7pjqh	1	checkbox	[Subtask 2]	{"value":false}	1665484116374	1665484116374	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7msb5wjtwgtnrxkdf79oe8o6roo	2022-10-11 10:28:36.386493+00	cmbngfj16pfnzij6six8ak7pjqh	1	checkbox	[Subtask 3]	{"value":false}	1665484116388	1665484116388	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
a5uodhfjkg7rpixif8pt1uk88to	2022-10-11 10:28:36.401035+00	cmbngfj16pfnzij6six8ak7pjqh	1	text	## Description\n*[Brief description of this task]*	{}	1665484116403	1665484116403	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
76b5d64urebdxdky1upt9xqd5io	2022-10-11 10:28:36.41504+00	c8xewtyxeo3ysprnqed7d6go3aa	1	divider		{}	1665484116417	1665484116417	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7fiatgq91hirz7fm6hi8rjrne4e	2022-10-11 10:28:36.42955+00	c8xewtyxeo3ysprnqed7d6go3aa	1	checkbox	[Subtask 3]	{"value":false}	1665484116431	1665484116431	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
733zbgfx9rprzzghddf6wk79bmo	2022-10-11 10:28:36.443738+00	c8xewtyxeo3ysprnqed7d6go3aa	1	checkbox	[Subtask 2]	{"value":false}	1665484116446	1665484116446	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
afsh8qrpkn3giip7t4shmgu9q6e	2022-10-11 10:28:36.457526+00	c8xewtyxeo3ysprnqed7d6go3aa	1	text	## Description\n*[Brief description of this task]*	{}	1665484116459	1665484116459	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
77a85z5y697fqtpaiuggu5bog6w	2022-10-11 10:28:36.472165+00	ctrr4h3o11jyzjkhimwp13q5rur	1	checkbox	[Subtask 3]	{"value":false}	1665484116474	1665484116474	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7yugrg7yb9fyuxxhn9oasy4ufxr	2022-10-11 10:28:36.486697+00	ctrr4h3o11jyzjkhimwp13q5rur	1	checkbox	[Subtask 2]	{"value":false}	1665484116489	1665484116489	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
aeio17fupd3d3fxgmpmbts14khr	2022-10-11 10:28:36.501333+00	ctrr4h3o11jyzjkhimwp13q5rur	1	text	## Description\n*[Brief description of this task]*	{}	1665484116503	1665484116503	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7fi4id6zhntr3zd73jto1cxxsie	2022-10-11 10:28:36.515879+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	[Subtask 3]	{"value":false}	1665484116518	1665484116518	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7by15kjutm3g8ffu68w5e51dwry	2022-10-11 10:28:36.530331+00	czw9es1e89fdpjr7cqptr1xq7qh	1	divider		{}	1665484116532	1665484116532	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
7zmeekq4hofyrtqcoum6aqwthsr	2022-10-11 10:28:36.546073+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	...	{"value":false}	1665484116548	1665484116548	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
axyjb5s7fz7d9xpdn397kgoxgow	2022-10-11 10:28:36.565085+00	czw9es1e89fdpjr7cqptr1xq7qh	1	text	## Checklist	{}	1665484116567	1665484116567	0	b6cuu7ogc4pyeijcxh3anappg6y	system	0	system
czia6hpnyhtrbpr5fikr66hn6sy	2022-10-11 10:28:36.580222+00	bxgo46mjubbr53q3m9qzphodsiy	1	card	Start a daily journal	{"contentOrder":[],"icon":"✍️","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","d6b1249b-bc18-45fc-889e-bec48fce80ef":"0a82977f-52bf-457b-841b-e2b7f76fb525","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"3245a32d-f688-463b-87f4-8e7142c1b397"}}	1665484116582	1665484116582	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
cp5iaboxt8tre5m4hxnacsdcd9c	2022-10-11 10:28:36.594254+00	bxgo46mjubbr53q3m9qzphodsiy	1	card	Learn to paint	{"contentOrder":[],"icon":"🎨","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"77c539af-309c-4db1-8329-d20ef7e9eacd","d6b1249b-bc18-45fc-889e-bec48fce80ef":"9a090e33-b110-4268-8909-132c5002c90e","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"3245a32d-f688-463b-87f4-8e7142c1b397"}}	1665484116596	1665484116596	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
7br1nnoptm7fxdd8yqu3zo9wexh	2022-10-11 10:28:37.182047+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	Set priorities and update statuses	{"value":false}	1665484117184	1665484117184	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
bxgo46mjubbr53q3m9qzphodsiy	2022-10-11 10:28:36.572972+00		1	board	Personal Goals 	{"cardProperties":[{"id":"af6fcbb8-ca56-4b73-83eb-37437b9a667d","name":"Status","options":[{"color":"propColorRed","id":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","value":"To Do"},{"color":"propColorYellow","id":"77c539af-309c-4db1-8329-d20ef7e9eacd","value":"Doing"},{"color":"propColorGreen","id":"98bdea27-0cce-4cde-8dc6-212add36e63a","value":"Done 🙌"}],"type":"select"},{"id":"d9725d14-d5a8-48e5-8de1-6f8c004a9680","name":"Category","options":[{"color":"propColorPurple","id":"3245a32d-f688-463b-87f4-8e7142c1b397","value":"Life Skills"},{"color":"propColorGreen","id":"80be816c-fc7a-4928-8489-8b02180f4954","value":"Finance"},{"color":"propColorOrange","id":"ffb3f951-b47f-413b-8f1d-238666728008","value":"Health"}],"type":"select"},{"id":"d6b1249b-bc18-45fc-889e-bec48fce80ef","name":"Target","options":[{"color":"propColorBlue","id":"9a090e33-b110-4268-8909-132c5002c90e","value":"Q1"},{"color":"propColorBrown","id":"0a82977f-52bf-457b-841b-e2b7f76fb525","value":"Q2"},{"color":"propColorGreen","id":"6e7139e4-5358-46bb-8c01-7b029a57b80a","value":"Q3"},{"color":"propColorPurple","id":"d5371c63-66bf-4468-8738-c4dc4bea4843","value":"Q4"}],"type":"select"},{"id":"ajy6xbebzopojaenbnmfpgtdwso","name":"Due Date","options":[],"type":"date"}],"description":"Use this template to set and accomplish new personal goals.","icon":"⛰️","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"7f32dc8d2ae008cfe56554e9363505cc"}	1665484116575	1665484116575	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
cuuis4prya7f8xbbcxwgut86eny	2022-10-11 10:28:36.587294+00	bxgo46mjubbr53q3m9qzphodsiy	1	card	Run 3 times a week	{"contentOrder":[],"icon":"🏃","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","d6b1249b-bc18-45fc-889e-bec48fce80ef":"6e7139e4-5358-46bb-8c01-7b029a57b80a","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"ffb3f951-b47f-413b-8f1d-238666728008"}}	1665484116589	1665484116589	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
ctnof4dg57fnftxembthdx1bhgo	2022-10-11 10:28:36.6017+00	bxgo46mjubbr53q3m9qzphodsiy	1	card	Open retirement account	{"contentOrder":[],"icon":"🏦","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","d6b1249b-bc18-45fc-889e-bec48fce80ef":"0a82977f-52bf-457b-841b-e2b7f76fb525","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"80be816c-fc7a-4928-8489-8b02180f4954"}}	1665484116603	1665484116603	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
v8h5wpe7p5by19fqzftoq6m35qo	2022-10-11 10:28:36.617852+00	bxgo46mjubbr53q3m9qzphodsiy	1	view	Calendar View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"ajy6xbebzopojaenbnmfpgtdwso","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1665484116620	1665484116620	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
btc3d9eo5dfd8txgdpi9unukije	2022-10-11 10:28:36.632171+00		1	board	Content Calendar 	{"cardProperties":[{"id":"ae9ar615xoknd8hw8py7mbyr7zo","name":"Status","options":[{"color":"propColorGray","id":"awna1nuarjca99m9s4uiy9kwj5h","value":"Idea 💡"},{"color":"propColorOrange","id":"a9ana1e9w673o5cp8md4xjjwfto","value":"Draft"},{"color":"propColorPurple","id":"apy9dcd7zmand615p3h53zjqxjh","value":"In Review"},{"color":"propColorBlue","id":"acri4cm3bmay55f7ksztphmtnga","value":"Ready to Publish"},{"color":"propColorGreen","id":"amsowcd9a8e1kid317r7ttw6uzh","value":"Published 🎉"}],"type":"select"},{"id":"aysx3atqexotgwp5kx6h5i5ancw","name":"Type","options":[{"color":"propColorOrange","id":"aywiofmmtd3ofgzj95ysky4pjga","value":"Press Release"},{"color":"propColorGreen","id":"apqdgjrmsmx8ngmp7zst51647de","value":"Sponsored Post"},{"color":"propColorPurple","id":"a3woynbjnb7j16e74uw3pubrytw","value":"Customer Story"},{"color":"propColorRed","id":"aq36k5pkpfcypqb3idw36xdi1fh","value":"Product Release"},{"color":"propColorGray","id":"azn66pmk34adygnizjqhgiac4ia","value":"Partnership"},{"color":"propColorBlue","id":"aj8y675weso8kpb6eceqbpj4ruw","value":"Feature Announcement"},{"color":"propColorYellow","id":"a3xky7ygn14osr1mokerbfah5cy","value":"Article"}],"type":"select"},{"id":"ab6mbock6styfe6htf815ph1mhw","name":"Channel","options":[{"color":"propColorBrown","id":"a8xceonxiu4n3c43szhskqizicr","value":"Website"},{"color":"propColorGreen","id":"a3pdzi53kpbd4okzdkz6khi87zo","value":"Blog"},{"color":"propColorOrange","id":"a3d9ux4fmi3anyd11kyipfbhwde","value":"Email"},{"color":"propColorRed","id":"a8cbbfdwocx73zn3787cx6gacsh","value":"Podcast"},{"color":"propColorPink","id":"aigjtpcaxdp7d6kmctrwo1ztaia","value":"Print"},{"color":"propColorBlue","id":"af1wsn13muho59e7ghwaogxy5ey","value":"Facebook"},{"color":"propColorGray","id":"a47zajfxwhsg6q8m7ppbiqs7jge","value":"LinkedIn"},{"color":"propColorYellow","id":"az8o8pfe9hq6s7xaehoqyc3wpyc","value":"Twitter"}],"type":"multiSelect"},{"id":"ao44fz8nf6z6tuj1x31t9yyehcc","name":"Assignee","options":[],"type":"person"},{"id":"a39x5cybshwrbjpc3juaakcyj6e","name":"Due Date","options":[],"type":"date"},{"id":"agqsoiipowmnu9rdwxm57zrehtr","name":"Publication Date","options":[],"type":"date"},{"id":"ap4e7kdg7eip7j3c3oyiz39eaoc","name":"Link","options":[],"type":"url"}],"description":"Use this template to plan and organize your editorial content.","icon":"📅","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"c75fbd659d2258b5183af2236d176ab4"}	1665484116634	1665484116634	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
cifr5gut6dpg69khjc914aagdic	2022-10-11 10:28:36.646574+00	btc3d9eo5dfd8txgdpi9unukije	1	card	[Tweet] Mattermost v6.1 includes card @-mention notifications in Boards	{"contentOrder":["7i96m7nbsdsex8n6hzuzrmdfjuy","7ed5bwp3gr8yax3mhtuwiaa9gjy","as4jknoo8978a58afrb7n467y6e","a7s5x1y1mdbnejf9xic5i54wtpa","abdasiyq4k7ndtfrdadrias8sjy","78zyx6dk31brk5rrcfjypibzpwo"],"icon":"🐤","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1639051200000}","ab6mbock6styfe6htf815ph1mhw":["az8o8pfe9hq6s7xaehoqyc3wpyc"],"ae9ar615xoknd8hw8py7mbyr7zo":"a9ana1e9w673o5cp8md4xjjwfto","agqsoiipowmnu9rdwxm57zrehtr":"{\\"from\\":1637668800000}","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://twitter.com/Mattermost/status/1463145633162969097?s=20","aysx3atqexotgwp5kx6h5i5ancw":"aj8y675weso8kpb6eceqbpj4ruw"}}	1665484116649	1665484116649	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
c3k9fdqp89pgypbe3boahwmtsta	2022-10-11 10:28:36.66182+00	btc3d9eo5dfd8txgdpi9unukije	1	card	Unblocking Workflows: The Guide to Developer Productivity	{"contentOrder":["77tz16jtz5x73ncs3dxc3fp1d7h","a1bzap4zq6ibhdcyci4b7cn8wko"],"icon":"💻","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1638532800000}","ab6mbock6styfe6htf815ph1mhw":["a3pdzi53kpbd4okzdkz6khi87zo"],"ae9ar615xoknd8hw8py7mbyr7zo":"apy9dcd7zmand615p3h53zjqxjh","agqsoiipowmnu9rdwxm57zrehtr":"{\\"from\\":1639483200000}","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://mattermost.com/newsroom/press-releases/mattermost-unveils-definitive-report-on-the-state-of-developer-productivity-unblocking-workflows-the-guide-to-developer-productivity-2022-edition/","aysx3atqexotgwp5kx6h5i5ancw":"a3xky7ygn14osr1mokerbfah5cy"}}	1665484116664	1665484116664	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
v574kgjuhcift8c89jsg1r4b71o	2022-10-11 10:28:36.676301+00	btc3d9eo5dfd8txgdpi9unukije	1	view	Due Date Calendar	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"a39x5cybshwrbjpc3juaakcyj6e","defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1665484116678	1665484116678	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
aw6yqos1j1bbyzpogh3cusif96o	2022-10-11 10:28:36.932685+00	cfefgwjke6bbxpjpig618g9bpte	1	text	## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\n*[A clear and concise description of what you expected to happen.]*\n\n## Screenshots\n\n*[If applicable, add screenshots to elaborate on the problem.]*\n\n## Edition and Platform\n\n - Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n - Version: *[e.g. v0.9.0]*\n - Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n\n*[Add any other context about the problem here.]*	{}	1665484116935	1665484116935	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
v5jkjadjdx3ryzjxbi56hr47opo	2022-10-11 10:28:36.624484+00	bxgo46mjubbr53q3m9qzphodsiy	1	view	By Date	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"d6b1249b-bc18-45fc-889e-bec48fce80ef","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["9a090e33-b110-4268-8909-132c5002c90e","0a82977f-52bf-457b-841b-e2b7f76fb525","6e7139e4-5358-46bb-8c01-7b029a57b80a","d5371c63-66bf-4468-8738-c4dc4bea4843",""],"visiblePropertyIds":["d9725d14-d5a8-48e5-8de1-6f8c004a9680"]}	1665484116626	1665484116626	0	bxgo46mjubbr53q3m9qzphodsiy	system	0	system
crhupzoiscpydpbay9ogofgzb1w	2022-10-11 10:28:36.639751+00	btc3d9eo5dfd8txgdpi9unukije	1	card	New Project and Workflow Management Solutions for Developers	{"contentOrder":["71qhnzuec6esdi6fnynwpze4xya","abuy87xcsfprnpmy8zbfej73j6o"],"icon":"🎯","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1645790400000}","ab6mbock6styfe6htf815ph1mhw":["a8xceonxiu4n3c43szhskqizicr","a3pdzi53kpbd4okzdkz6khi87zo","a3d9ux4fmi3anyd11kyipfbhwde"],"ae9ar615xoknd8hw8py7mbyr7zo":"awna1nuarjca99m9s4uiy9kwj5h","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://mattermost.com/newsroom/press-releases/mattermost-launches-new-project-and-workflow-management-solutions-for-developers/","aysx3atqexotgwp5kx6h5i5ancw":"aywiofmmtd3ofgzj95ysky4pjga"}}	1665484116642	1665484116642	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
cnkpwjnu867f73y3pdtj4f55hge	2022-10-11 10:28:36.654043+00	btc3d9eo5dfd8txgdpi9unukije	1	card	Top 10 Must-Have DevOps Tools in 2021	{"contentOrder":["7fo1utqc8x1z1z6hzg33hes1ktc","aiwd71qpf77fkxe9pga81gr43zw"],"icon":"🛠️","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1636113600000}","ab6mbock6styfe6htf815ph1mhw":["a8xceonxiu4n3c43szhskqizicr"],"ae9ar615xoknd8hw8py7mbyr7zo":"a9ana1e9w673o5cp8md4xjjwfto","agqsoiipowmnu9rdwxm57zrehtr":"{\\"from\\":1637323200000}","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://www.toolbox.com/tech/devops/articles/best-devops-tools/","aysx3atqexotgwp5kx6h5i5ancw":"a3xky7ygn14osr1mokerbfah5cy"}}	1665484116656	1665484116656	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
v7p5xcadfc3bfzyukb3b3dfo6wr	2022-10-11 10:28:36.668908+00	btc3d9eo5dfd8txgdpi9unukije	1	view	By Status	{"cardOrder":[null,"cdbfkd15d6iy18rgx1tskmfsr6c","cn8yofg9rtkgmzgmb5xdi56p3ic","csgsnnywpuqzs5jgq87snk9x17e","cqwaytore5y487wdu8zffppqnea",null],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["awna1nuarjca99m9s4uiy9kwj5h","a9ana1e9w673o5cp8md4xjjwfto","apy9dcd7zmand615p3h53zjqxjh","acri4cm3bmay55f7ksztphmtnga","amsowcd9a8e1kid317r7ttw6uzh",""],"visiblePropertyIds":["ab6mbock6styfe6htf815ph1mhw"]}	1665484116671	1665484116671	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
vgi13ig38ttbffpug5u4z4yx9wo	2022-10-11 10:28:36.683462+00	btc3d9eo5dfd8txgdpi9unukije	1	view	Publication Calendar	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"agqsoiipowmnu9rdwxm57zrehtr","defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1665484116685	1665484116685	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
abuy87xcsfprnpmy8zbfej73j6o	2022-10-11 10:28:36.698209+00	crhupzoiscpydpbay9ogofgzb1w	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1665484116700	1665484116700	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
as4jknoo8978a58afrb7n467y6e	2022-10-11 10:28:36.712017+00	cifr5gut6dpg69khjc914aagdic	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1665484116714	1665484116714	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
ajupzqkhcpfrofxqpg3scyiwaee	2022-10-11 10:28:36.726323+00	cff1jmrxfrirgbeebhr9qd7nida	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1665484116728	1665484116728	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
adcxzq9aunbf45guxsc8srcsxxw	2022-10-11 10:28:36.74115+00	cff1jmrxfrirgbeebhr9qd7nida	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1665484116743	1665484116743	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
a1bzap4zq6ibhdcyci4b7cn8wko	2022-10-11 10:28:36.756611+00	c3k9fdqp89pgypbe3boahwmtsta	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1665484116759	1665484116759	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
c4k4dqm7ixibc3ekbsptgi174ao	2022-10-11 10:28:36.784974+00	b41kxw97cd7899ctkgswuoe811w	1	card	App crashing	{"contentOrder":["79t7rkiuspeneqi9xurou9tqzwh","aewhyyg7pcbbd7euy4yhm4wyhio","ay61uqe1u9jfg8ntzfyejdc1e4e","73j3wx3hocpbxxc5wgrpxmusm4o"],"icon":"📉","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"1fdbb515-edd2-4af5-80fc-437ed2211a49","50117d52-bcc7-4750-82aa-831a351c44a0":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","60985f46-3e41-486e-8213-2b987440ea1c":"c01676ca-babf-4534-8be5-cce2287daa6c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9"}}	1665484116787	1665484116787	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
chtobgq1x63rbukyzq3et8dcnar	2022-10-11 10:28:36.799257+00	b41kxw97cd7899ctkgswuoe811w	1	card	Standard templates	{"contentOrder":["7uonmjk41nipnrsi6tz8wau5ssh","ank5cpbddh7dy8fxfkcjkd8sxqy"],"icon":"🗺️","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"6eea96c9-4c61-4968-8554-4b7537e8f748","50117d52-bcc7-4750-82aa-831a351c44a0":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","60985f46-3e41-486e-8213-2b987440ea1c":"ed4a5340-460d-461b-8838-2c56e8ee59fe","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1665484116801	1665484116801	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
cmtnbp3xc7ibzfbr34wcz9yzxcc	2022-10-11 10:28:36.81372+00	b41kxw97cd7899ctkgswuoe811w	1	card	Review API design	{"contentOrder":["a5yqeyxuxypg97g85uo5ttq176e"],"icon":"🛣️","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"424ea5e3-9aa1-4075-8c5c-01b44b66e634","50117d52-bcc7-4750-82aa-831a351c44a0":"8c557f69-b0ed-46ec-83a3-8efab9d47ef5","60985f46-3e41-486e-8213-2b987440ea1c":"14892380-1a32-42dd-8034-a0cea32bc7e6","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"c62172ea-5da7-4dec-8186-37267d8ee9a7"}}	1665484116816	1665484116816	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
vxqbydmf84tf7xnemqw7e9bo43c	2022-10-11 10:28:36.828678+00	b41kxw97cd7899ctkgswuoe811w	1	view	Calendar View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"a4378omyhmgj3bex13sj4wbpfiy","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1665484116831	1665484116831	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
ad31ry1q5ifnkdm87en31545gky	2022-10-11 10:28:36.94838+00	cidz4imnqhir48brz6e8hxhfrhy	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1665484116950	1665484116950	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
vu41qq5cg1bdedfna1aagfe6kjh	2022-10-11 10:28:36.690861+00	btc3d9eo5dfd8txgdpi9unukije	1	view	Content List	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"__title":322,"ab6mbock6styfe6htf815ph1mhw":229,"aysx3atqexotgwp5kx6h5i5ancw":208},"defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"a39x5cybshwrbjpc3juaakcyj6e","reversed":false}],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["ae9ar615xoknd8hw8py7mbyr7zo","aysx3atqexotgwp5kx6h5i5ancw","ab6mbock6styfe6htf815ph1mhw","ao44fz8nf6z6tuj1x31t9yyehcc","a39x5cybshwrbjpc3juaakcyj6e","agqsoiipowmnu9rdwxm57zrehtr","ap4e7kdg7eip7j3c3oyiz39eaoc"]}	1665484116693	1665484116693	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
78zyx6dk31brk5rrcfjypibzpwo	2022-10-11 10:28:36.705272+00	cifr5gut6dpg69khjc914aagdic	1	image		{"fileId":"7y5kr8x8ybpnwdykjfuz57rggrh.png"}	1665484116707	1665484116707	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
a7s5x1y1mdbnejf9xic5i54wtpa	2022-10-11 10:28:36.719314+00	cifr5gut6dpg69khjc914aagdic	1	text	## Media	{}	1665484116721	1665484116721	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
a5dp1j9zzo3dui8i53d7hyajtkc	2022-10-11 10:28:36.734229+00	cff1jmrxfrirgbeebhr9qd7nida	1	text	## Research\n- ...\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n- ...\n\n## Notes\n- ...\n- ...\n- ...	{}	1665484116736	1665484116736	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
aiwd71qpf77fkxe9pga81gr43zw	2022-10-11 10:28:36.748886+00	cnkpwjnu867f73y3pdtj4f55hge	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1665484116751	1665484116751	0	btc3d9eo5dfd8txgdpi9unukije	system	0	system
b41kxw97cd7899ctkgswuoe811w	2022-10-11 10:28:36.777929+00		1	board	Roadmap 	{"cardProperties":[{"id":"50117d52-bcc7-4750-82aa-831a351c44a0","name":"Status","options":[{"color":"propColorGray","id":"8c557f69-b0ed-46ec-83a3-8efab9d47ef5","value":"Not Started"},{"color":"propColorYellow","id":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","value":"In Progress"},{"color":"propColorGreen","id":"849766ba-56a5-48d1-886f-21672f415395","value":"Complete 🙌"}],"type":"select"},{"id":"20717ad3-5741-4416-83f1-6f133fff3d11","name":"Type","options":[{"color":"propColorYellow","id":"424ea5e3-9aa1-4075-8c5c-01b44b66e634","value":"Epic ⛰"},{"color":"propColorGreen","id":"6eea96c9-4c61-4968-8554-4b7537e8f748","value":"Task 🔨"},{"color":"propColorRed","id":"1fdbb515-edd2-4af5-80fc-437ed2211a49","value":"Bug 🐞"}],"type":"select"},{"id":"60985f46-3e41-486e-8213-2b987440ea1c","name":"Sprint","options":[{"color":"propColorBrown","id":"c01676ca-babf-4534-8be5-cce2287daa6c","value":"Sprint 1"},{"color":"propColorPurple","id":"ed4a5340-460d-461b-8838-2c56e8ee59fe","value":"Sprint 2"},{"color":"propColorBlue","id":"14892380-1a32-42dd-8034-a0cea32bc7e6","value":"Sprint 3"}],"type":"select"},{"id":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","name":"Priority","options":[{"color":"propColorRed","id":"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9","value":"P1 🔥"},{"color":"propColorYellow","id":"e6a7f297-4440-4783-8ab3-3af5ba62ca11","value":"P2"},{"color":"propColorGray","id":"c62172ea-5da7-4dec-8186-37267d8ee9a7","value":"P3"}],"type":"select"},{"id":"aphg37f7zbpuc3bhwhp19s1ribh","name":"Assignee","options":[],"type":"person"},{"id":"a4378omyhmgj3bex13sj4wbpfiy","name":"Due Date","options":[],"type":"date"},{"id":"a36o9q1yik6nmar6ri4q4uca7ey","name":"Created Date","options":[],"type":"createdTime"},{"id":"ai7ajsdk14w7x5s8up3dwir77te","name":"Design Link","options":[],"type":"url"}],"description":"Use this template to plan your roadmap and manage your releases more efficiently.","icon":"🗺️","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"b728c6ca730e2cfc229741c5a4712b65"}	1665484116780	1665484116780	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
cey7hpx5q8tyhzrrto7r7dnpiyy	2022-10-11 10:28:36.791861+00	b41kxw97cd7899ctkgswuoe811w	1	card	Calendar view	{"contentOrder":["7df11783ny67mdnognqae31ax6y","a7876syp5epd9dxprfjz6rbq6jo"],"icon":"📆","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"6eea96c9-4c61-4968-8554-4b7537e8f748","50117d52-bcc7-4750-82aa-831a351c44a0":"849766ba-56a5-48d1-886f-21672f415395","60985f46-3e41-486e-8213-2b987440ea1c":"c01676ca-babf-4534-8be5-cce2287daa6c","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1665484116794	1665484116794	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
cnpwidyuyb7yytbk7c7wpt3hixe	2022-10-11 10:28:36.806542+00	b41kxw97cd7899ctkgswuoe811w	1	card	Import / Export	{"contentOrder":["ahp7i9y5843riuetuq1bd31qwsc"],"icon":"🚢","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"6eea96c9-4c61-4968-8554-4b7537e8f748","50117d52-bcc7-4750-82aa-831a351c44a0":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","60985f46-3e41-486e-8213-2b987440ea1c":"c01676ca-babf-4534-8be5-cce2287daa6c","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1665484116809	1665484116808	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
ccti3h7zsxigppxafizydxqqr9h	2022-10-11 10:28:36.821532+00	b41kxw97cd7899ctkgswuoe811w	1	card	Icons don't display	{"contentOrder":["awuokcnksjjbh5b6oaspgixncqo","agmbibza1ztrxibzidaq9k7os5r","718jef5t65j8zxxnskjc9g8z85o"],"icon":"💻","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"1fdbb515-edd2-4af5-80fc-437ed2211a49","50117d52-bcc7-4750-82aa-831a351c44a0":"8c557f69-b0ed-46ec-83a3-8efab9d47ef5","60985f46-3e41-486e-8213-2b987440ea1c":"ed4a5340-460d-461b-8838-2c56e8ee59fe","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1665484116823	1665484116823	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
v6jhsou34fbna9m8igaw9p1hfec	2022-10-11 10:28:36.839036+00	b41kxw97cd7899ctkgswuoe811w	1	view	Board: Sprints	{"cardOrder":["c4k4dqm7ixibc3ekbsptgi174ao","cey7hpx5q8tyhzrrto7r7dnpiyy","chtobgq1x63rbukyzq3et8dcnar","ccti3h7zsxigppxafizydxqqr9h","cnpwidyuyb7yytbk7c7wpt3hixe","cmtnbp3xc7ibzfbr34wcz9yzxcc"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cidz4imnqhir48brz6e8hxhfrhy","filter":{"filters":[],"operation":"and"},"groupById":"60985f46-3e41-486e-8213-2b987440ea1c","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","reversed":false}],"viewType":"board","visibleOptionIds":["c01676ca-babf-4534-8be5-cce2287daa6c","ed4a5340-460d-461b-8838-2c56e8ee59fe","14892380-1a32-42dd-8034-a0cea32bc7e6",""],"visiblePropertyIds":["20717ad3-5741-4416-83f1-6f133fff3d11","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1665484116844	1665484116844	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
vw5tkfu57qfno9qyeesgqx6qarc	2022-10-11 10:28:36.857801+00	b41kxw97cd7899ctkgswuoe811w	1	view	Board: Status	{"cardOrder":["c4k4dqm7ixibc3ekbsptgi174ao","cm4w7cc3aac6s9jdcujbs4j8f4r","c6egh6cpnj137ixdoitsoxq17oo","cct9u78utsdyotmejbmwwg66ihr","cmft87it1q7yebbd51ij9k65xbw","c9fe77j9qcruxf4itzib7ag6f1c","coup7afjknqnzbdwghiwbsq541w","c5ex1hndz8qyc8gx6ofbfeksftc"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cidz4imnqhir48brz6e8hxhfrhy","filter":{"filters":[],"operation":"and"},"groupById":"50117d52-bcc7-4750-82aa-831a351c44a0","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","reversed":false}],"viewType":"board","visibleOptionIds":["8c557f69-b0ed-46ec-83a3-8efab9d47ef5","ec6d2bc5-df2b-4f77-8479-e59ceb039946","849766ba-56a5-48d1-886f-21672f415395",""],"visiblePropertyIds":["20717ad3-5741-4416-83f1-6f133fff3d11","60985f46-3e41-486e-8213-2b987440ea1c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1665484116860	1665484116860	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
73j3wx3hocpbxxc5wgrpxmusm4o	2022-10-11 10:28:36.872506+00	c4k4dqm7ixibc3ekbsptgi174ao	1	image		{"fileId":"77pe9r4ckbin438ph3f18bpatua.png"}	1665484116874	1665484116874	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
ay61uqe1u9jfg8ntzfyejdc1e4e	2022-10-11 10:28:36.886593+00	c4k4dqm7ixibc3ekbsptgi174ao	1	text	## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*	{}	1665484116889	1665484116889	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
vch8buek11i8zjrf4ro7uhh1nrr	2022-10-11 10:28:36.850179+00	b41kxw97cd7899ctkgswuoe811w	1	view	List: Tasks 🔨	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"50117d52-bcc7-4750-82aa-831a351c44a0":139,"__title":280},"defaultTemplateId":"","filter":{"filters":[{"condition":"includes","propertyId":"20717ad3-5741-4416-83f1-6f133fff3d11","values":["6eea96c9-4c61-4968-8554-4b7537e8f748"]}],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"50117d52-bcc7-4750-82aa-831a351c44a0","reversed":true}],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["50117d52-bcc7-4750-82aa-831a351c44a0","20717ad3-5741-4416-83f1-6f133fff3d11","60985f46-3e41-486e-8213-2b987440ea1c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1665484116852	1665484116852	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
vf5hjmyfy1iyb7gjory3uggzbdy	2022-10-11 10:28:36.865078+00	b41kxw97cd7899ctkgswuoe811w	1	view	List: Bugs 🐞	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"50117d52-bcc7-4750-82aa-831a351c44a0":145,"__title":280},"defaultTemplateId":"","filter":{"filters":[{"condition":"includes","propertyId":"20717ad3-5741-4416-83f1-6f133fff3d11","values":["1fdbb515-edd2-4af5-80fc-437ed2211a49"]}],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","reversed":false}],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["50117d52-bcc7-4750-82aa-831a351c44a0","20717ad3-5741-4416-83f1-6f133fff3d11","60985f46-3e41-486e-8213-2b987440ea1c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1665484116867	1665484116867	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
aewhyyg7pcbbd7euy4yhm4wyhio	2022-10-11 10:28:36.8798+00	c4k4dqm7ixibc3ekbsptgi174ao	1	text	## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*	{}	1665484116882	1665484116882	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
a7876syp5epd9dxprfjz6rbq6jo	2022-10-11 10:28:36.894402+00	cey7hpx5q8tyhzrrto7r7dnpiyy	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1665484116896	1665484116896	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
7xowaocwet3y48kqmwh3bh86a8h	2022-10-11 10:28:36.910372+00	cfefgwjke6bbxpjpig618g9bpte	1	image		{"fileId":"7pbp4qg415pbstc6enzeicnu3qh.png"}	1665484116912	1665484116912	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
akapa6sd8i7no7y4777wck36ato	2022-10-11 10:28:36.924854+00	cfefgwjke6bbxpjpig618g9bpte	1	text	## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\nA clear and concise description of what you expected to happen.\n\n## Edition and Platform\n\n - Edition: Personal Desktop / Personal Server / Mattermost plugin\n - Version: [e.g. v0.9.0]\n - Browser and OS: [e.g. Chrome 91 on macOS, Edge 93 on Windows]\n\n## Additional context\n\nAdd any other context about the problem here.	{}	1665484116927	1665484116927	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
ahp7i9y5843riuetuq1bd31qwsc	2022-10-11 10:28:36.940829+00	cnpwidyuyb7yytbk7c7wpt3hixe	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1665484116943	1665484116943	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
a9dp5yjhinig6tgebpa94mrsjga	2022-10-11 10:28:36.95594+00	cidz4imnqhir48brz6e8hxhfrhy	1	text	## Requirements\n- [Requirement 1]\n- [Requirement 2]\n- ...	{}	1665484116958	1665484116958	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
718jef5t65j8zxxnskjc9g8z85o	2022-10-11 10:28:36.969607+00	ccti3h7zsxigppxafizydxqqr9h	1	image		{"fileId":"7pbp4qg415pbstc6enzeicnu3qh.png"}	1665484116971	1665484116971	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
awuokcnksjjbh5b6oaspgixncqo	2022-10-11 10:28:36.983927+00	ccti3h7zsxigppxafizydxqqr9h	1	text	## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*	{}	1665484116986	1665484116986	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
a9qtx8yq5ifrcdkxtj4wgfqif7y	2022-10-11 10:28:36.998218+00	cwrq9ag3p5pgzzy98nfd3wwra1w	1	text	## Summary\n[Brief description of what this epic is about]\n\n## Motivation\n[Brief description on why this is needed]\n\n## Acceptance Criteria\n - [Criteron 1]\n - [Criteron 2]\n - ...\n\n## Personas\n - [Persona A]\n - [Persona B]\n - ...\n\n## Reference Materials\n - [Links to other relevant documents as needed]\n - ...	{}	1665484117000	1665484117000	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
ckuh9ftjhtpbbxbhe95ymqkq85c	2022-10-11 10:28:37.04213+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Drag cards	{"contentOrder":["apktbgtee5jb8xrnqy3ibiujxew","aq5ytc3po13fudyq6bbjm8d3ahe"],"icon":"🤏","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#dragging-cards","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1665484117044	1665484117044	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
cqz3o1wudajf93d8naeadh3yjme	2022-10-11 10:28:37.056334+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Create your own board	{"contentOrder":["a3bz37jponjgpunmzbch7in9w1w","a9se59c449jrhzm43bnsuhkw9ya","7r9my1yuddbn45dojrfht3neg8c","7eir5gdjxgjbsxpbyp3df4npcze","75m7g7abkc7gfpfrfayuwk7u5ey"],"icon":"📋","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-boards","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"amm6wfhnbuxojwssyftgs9dipqe","acypkejeb5yfujhj9te57p9kaxw":"aanaehcw3m13jytujsjk5hpf6ry"}}	1665484117058	1665484117058	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
czfmkmwczt7bi8e6o73m7wp874y	2022-10-11 10:28:37.071297+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Create a new card	{"contentOrder":["abmhoj7ud6tf3zgphbcaaqaisbw","adhsx4h5ss7rqdcjt8xyam6xtqc","aupxac94k3pnezrmorqd3f43eno","7me9p46gbqiyfmfnapi7dyxb5br","79e9x9r9h4jn9mxp9rth68casga"],"icon":"📝","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#adding-cards","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"amm6wfhnbuxojwssyftgs9dipqe","acypkejeb5yfujhj9te57p9kaxw":"aanaehcw3m13jytujsjk5hpf6ry"}}	1665484117073	1665484117073	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
cxjthfrkca3ybdpg3x4yc3n47ro	2022-10-11 10:28:37.086435+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Filter and sort cards	{"contentOrder":["a4fz9kcfs9ibj8puk9mux7ac94c","ay36inrifupg5jenxk1gpxsf1pc","78i8aqjmqtibr7x4okhz6uqquqr","7ciy7wejextbuzcgbnwqo4kcygo"],"icon":"🎛️","isTemplate":false,"properties":{"a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1665484117089	1665484117089	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
a4hewy143x3d9fk8faaxwhbn9xa	2022-10-11 10:28:36.991077+00	cwrq9ag3p5pgzzy98nfd3wwra1w	1	text	## Summary\n*[Brief description of what this epic is about]*\n## Motivation\n*[Brief description on why this is needed]*\n## Acceptance Criteria\n- *[Criteron 1]*\n- *[Criteron 2]*\n- ...\n## Personas\n- *[Persona A]*\n- *[Persona B]*\n- ...\n## Reference Materials\n- *[Links to other relevant documents as needed]*\n- ...	{}	1665484116993	1665484116993	0	b41kxw97cd7899ctkgswuoe811w	system	0	system
byqqfpiy7ofye9xwposybdcne9w	2022-10-11 10:28:37.03438+00		1	board	Welcome to Boards!	{"cardProperties":[{"id":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","name":"Status","options":[{"color":"propColorRed","id":"amm6wfhnbuxojwssyftgs9dipqe","value":"To do 🔥"},{"color":"propColorYellow","id":"af3p8ztcyxgn8wd9z4az7o9tjeh","value":"Next up"},{"color":"propColorPurple","id":"ajurey3xkocs1nwx8di5zx6oe7o","value":"Later"},{"color":"propColorGreen","id":"agkinkjy5983wsk6kppsujajxqw","value":"Completed 🙌"}],"type":"select"},{"id":"acypkejeb5yfujhj9te57p9kaxw","name":"Priority","options":[{"color":"propColorOrange","id":"aanaehcw3m13jytujsjk5hpf6ry","value":"1. High"},{"color":"propColorBrown","id":"ascd7nm9r491ayot8i86g1gmgqw","value":"2. Medium"},{"color":"propColorGray","id":"aq6ukoiciyfctgwyhwzpfss8ghe","value":"3. Low"}],"type":"select"},{"id":"aqh13jabwexjkzr3jqsz1i1syew","name":"Assignee","options":[],"type":"person"},{"id":"acmg7mz1rr1eykfug4hcdpb1y1o","name":"Due Date","options":[],"type":"date"},{"id":"amewjwfjrtpu8ha73xsrdmxazxr","name":"Reviewed","options":[],"type":"checkbox"},{"id":"attzzboqaz6m1sdti5xa7gjnk1e","name":"Last updated time","options":[],"type":"updatedTime"},{"id":"a4nfnb5xr3txr5xq7y9ho7kyz6c","name":"Reference","options":[],"type":"url"},{"id":"a9gzwi3dt5n55nddej6zcbhxaeh","name":"Created by","options":[],"type":"createdBy"}],"description":"Mattermost Boards is an open source project management tool that helps you organize, track, and manage work across teams. Select a card to learn more.","icon":"👋","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"65aba997282f3ac457cd66736fb86915"}	1665484117037	1665484117037	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
cr9iyxt9hetrcibr8u33zxjbqcw	2022-10-11 10:28:37.049248+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Manage tasks with cards	{"contentOrder":["aad84aec6apdwzqh6hiuehenyay","7br1nnoptm7fxdd8yqu3zo9wexh","7hqpsp63zfifdm8kr7djioy4jrh","784uu3ufcgb878ky7hyugmf6xcw","78c5eda8cbibhbb1pty316j6quy","7hhckzt5i67bn9n44r54chrpiey","7ftwphgbimffjbc543uxgitjoje","7nb8y7jyoetro8cd36qcju53z8c","7tfrdm5nqfjbq7jjc8uio9aquew","7pr3t3kuuhiddieftuc5oiw4siw","76nwb9tqfsid5jx46yw34itqima","7dy3mcgzgybf1ifa3emgewkzj7e","a5ca6tii33bfw8ba36y1rswq3he","7876od6xhffr6fy69zeogag7eyw","7x7bq9awkatbm5x4docbh5gaw4y","7ghpx9qff43dgtke1rwidmge1ho","7nb8y7jyoetro8cd36qcju53z8c","7hdyxemhbytfm3m83g88djq9nhr","7pgnejxokubbe9kdrxj6g9qa41e","7hw9z6qtx8jyizkmm9g5yq3gxcy","7gk6ooz6npbb8by5rgp9aig7tua","7adxr5gwg8jfzjd1jo8rjq3kgtw"],"icon":"☑️","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"amm6wfhnbuxojwssyftgs9dipqe","acypkejeb5yfujhj9te57p9kaxw":"aanaehcw3m13jytujsjk5hpf6ry"}}	1665484117051	1665484117051	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
c74wyzodn1tn9jgbs4ydzmeijpc	2022-10-11 10:28:37.063944+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Share a board	{"contentOrder":["a1kx15ffj5fr5zdoxfoaztoo6mr","abt4rhu1wet8qtyq3rcqqkm645e","7r7asyew8d7fyunf4sow8e5iyoc","ad8j3n8tp77bppee3ipjt6odgpe","7w935usqt6pby8qz9x5pxaj7iow","7ogbs8h6q4j8z7ngy1m7eag63nw","7z1jau5qy3jfcxdp5cgq3duk6ne","7e553jp3c57bjugt645jr3ba5oe"],"icon":"📤","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/sharing-boards.html","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1665484117066	1665484117066	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
cnwpqrezw5fdidy55qeyx184rnh	2022-10-11 10:28:37.078504+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Share cards on Channels	{"contentOrder":["a3ftohdqo6iyzppe8jejzzbda9o","acdc7g8ddtfd1mjychhggr79g5o","acqdpt77s47nmxkqojrr3a4ri1y","7wc8fd9957iro7x4dtikxgpmyxa"],"icon":"📮","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html#share-card-previews","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"af3p8ztcyxgn8wd9z4az7o9tjeh","acypkejeb5yfujhj9te57p9kaxw":"ascd7nm9r491ayot8i86g1gmgqw"}}	1665484117081	1665484117081	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
ci5f44d3n4pn9tfgey3pnd66k3a	2022-10-11 10:28:37.094106+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Create a new view	{"contentOrder":["aozbezukpgif3jpbsq7tahmmp5e","aaxu6d9kxybg178ij5zqpx58ady","7owai1ux3h3gtf8byynfk6hyx1c","7n8jq1dizyfgotby3o91arf1hxh","77y4wffj1ctg7xmm9bx45qn6q6o","7uo89x8pyg3bgj8jtxyd5uwfkua"],"icon":"👓","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-views","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"af3p8ztcyxgn8wd9z4az7o9tjeh","acypkejeb5yfujhj9te57p9kaxw":"ascd7nm9r491ayot8i86g1gmgqw"}}	1665484117096	1665484117096	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
cmfp91m37e38sdf9rbw698mqr9y	2022-10-11 10:28:37.108748+00	byqqfpiy7ofye9xwposybdcne9w	1	card	@mention teammates	{"contentOrder":["adewfwnr5b3fb5mofxz43c9urha","an8q8ombf6t8zfydkzo9km43hoe","7mbw9t71hjbrydgzgkqqaoh8usr","7obfpazf9xigi9y8b83f1h84znh"],"icon":"🔔","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html#mention-people","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1665484117111	1665484117111	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
v4qqur776z38tzm1iwmbug66kqc	2022-10-11 10:28:37.12303+00	byqqfpiy7ofye9xwposybdcne9w	1	view	Preview: Calendar View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"acmg7mz1rr1eykfug4hcdpb1y1o","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1665484117125	1665484117125	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
vf88pqim7ptdapk9p7emhyfq9ho	2022-10-11 10:28:37.138308+00	byqqfpiy7ofye9xwposybdcne9w	1	view	Onboarding	{"cardOrder":["czfmkmwczt7bi8e6o73m7wp874y","cr9iyxt9hetrcibr8u33zxjbqcw","cqz3o1wudajf93d8naeadh3yjme","cnwpqrezw5fdidy55qeyx184rnh","cy83mbaa7fj8dtbm31fkgdmc18c","ci5f44d3n4pn9tfgey3pnd66k3a","cmfp91m37e38sdf9rbw698mqr9y","ckuh9ftjhtpbbxbhe95ymqkq85c","c74wyzodn1tn9jgbs4ydzmeijpc","cxjthfrkca3ybdpg3x4yc3n47ro"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","hiddenOptionIds":[""],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["aqb5x3pt87dcc9stbk4ofodrpoy","a1mtm777bkagq3iuu7xo9b13qfr","auxbwzptiqzkii5r61uz3ndsy1r","aj9386k1bx8qwmepeuxg3b7z4pw"],"visiblePropertyIds":[]}	1665484117140	1665484117140	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
78c5eda8cbibhbb1pty316j6quy	2022-10-11 10:28:37.152821+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	Assign tasks to teammates	{"value":false}	1665484117155	1665484117155	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7hhckzt5i67bn9n44r54chrpiey	2022-10-11 10:28:37.167272+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	Add and update descriptions with Markdown	{"value":false}	1665484117169	1665484117169	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
cy83mbaa7fj8dtbm31fkgdmc18c	2022-10-11 10:28:37.101514+00	byqqfpiy7ofye9xwposybdcne9w	1	card	Add new properties	{"contentOrder":["aegyio7cabbgg8e47afuqg9gtpe","ayhk11qsuz789fk8bqae4oz8mro","7gc3z8cf8rirgfyutwoke9nn6jy","76cinqnb6k3dzmfbm9fnc8eofny","7ssoad5exjffiicg78bimb9d1na"],"icon":"🏷️","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html#add-and-manage-properties","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"af3p8ztcyxgn8wd9z4az7o9tjeh","acypkejeb5yfujhj9te57p9kaxw":"ascd7nm9r491ayot8i86g1gmgqw"}}	1665484117103	1665484117103	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
vknonqwtmojy3fmzs7ine73gkuo	2022-10-11 10:28:37.115802+00	byqqfpiy7ofye9xwposybdcne9w	1	view	Preview: Table View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"__title":280,"a972dc7a-5f4c-45d2-8044-8c28c69717f1":100,"acypkejeb5yfujhj9te57p9kaxw":169},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["a972dc7a-5f4c-45d2-8044-8c28c69717f1","aqh13jabwexjkzr3jqsz1i1syew","acmg7mz1rr1eykfug4hcdpb1y1o","acypkejeb5yfujhj9te57p9kaxw"]}	1665484117118	1665484117118	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
vwuow7uzqbb86fx17gthhdaw37o	2022-10-11 10:28:37.130362+00	byqqfpiy7ofye9xwposybdcne9w	1	view	Preview: Gallery View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"gallery","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1665484117132	1665484117132	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
aq5ytc3po13fudyq6bbjm8d3ahe	2022-10-11 10:28:37.145573+00	ckuh9ftjhtpbbxbhe95ymqkq85c	1	text	Mattermost Boards makes it easy for you to update certain properties on cards through our drag and drop functionality. Simply drag this card from the **Later** column to the **Completed** column to automatically update the status and mark this task as complete.	{}	1665484117148	1665484117148	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7adxr5gwg8jfzjd1jo8rjq3kgtw	2022-10-11 10:28:37.159951+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	Create and manage checklists, like this one... :)	{"value":false}	1665484117162	1665484117162	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7tfrdm5nqfjbq7jjc8uio9aquew	2022-10-11 10:28:37.174592+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	Follow cards to get notified on the latest updates	{"value":false}	1665484117177	1665484117177	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7ftwphgbimffjbc543uxgitjoje	2022-10-11 10:28:37.189124+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	Provide feedback and ask questions via comments	{"value":false}	1665484117191	1665484117191	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7hqpsp63zfifdm8kr7djioy4jrh	2022-10-11 10:28:37.202738+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	Manage deadlines and milestones	{"value":false}	1665484117205	1665484117205	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
75m7g7abkc7gfpfrfayuwk7u5ey	2022-10-11 10:28:37.217179+00	cqz3o1wudajf93d8naeadh3yjme	1	image		{"fileId":"74uia99m9btr8peydw7oexn37tw.gif"}	1665484117219	1665484117219	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
a9se59c449jrhzm43bnsuhkw9ya	2022-10-11 10:28:37.231845+00	cqz3o1wudajf93d8naeadh3yjme	1	text	To create your own board, select the "+" on the top of the left hand sidebar. Choose from one of our standard templates and see how they can help you get started with your next project:\n\n- **Project Tasks**: Stay on top of your project tasks, track progress, and set priorities. \n- **Meeting Agenda**: Set your meeting agendas for recurring team meetings and 1:1s.\n- **Roadmap**: Plan your roadmap and manage your releases more efficiently.\n- **Personal Tasks**: Organize your life and track your personal tasks.\n- **Content Calendar**: Plan your editorial content, assign work, and track deadlines.\n- **Personal Goals**: Set and accomplish new personal goals and milestones.	{}	1665484117234	1665484117234	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
a1kx15ffj5fr5zdoxfoaztoo6mr	2022-10-11 10:28:37.246259+00	c74wyzodn1tn9jgbs4ydzmeijpc	1	text	Keep stakeholders and customers up-to-date on project progress by sharing your board.	{}	1665484117248	1665484117248	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
79e9x9r9h4jn9mxp9rth68casga	2022-10-11 10:28:37.261684+00	czfmkmwczt7bi8e6o73m7wp874y	1	image		{"fileId":"7iw4rxx7jj7bypmdotd9z469cyh.png"}	1665484117264	1665484117264	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
abmhoj7ud6tf3zgphbcaaqaisbw	2022-10-11 10:28:37.2755+00	czfmkmwczt7bi8e6o73m7wp874y	1	text	Mattermost Boards helps you manage and track all your project tasks with **Cards**.	{}	1665484117277	1665484117277	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
acqdpt77s47nmxkqojrr3a4ri1y	2022-10-11 10:28:37.289419+00	cnwpqrezw5fdidy55qeyx184rnh	1	text	After you've copied the link, paste it into any channel or Direct Message to share the card. A preview of the card will display within the channel with a link back to the card on Boards.	{}	1665484117291	1665484117291	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
a3ftohdqo6iyzppe8jejzzbda9o	2022-10-11 10:28:37.304095+00	cnwpqrezw5fdidy55qeyx184rnh	1	text	Cards can be linked and shared with teammates directly on Channels. Card previews are displayed when shared on Channels, so your team can discuss work items and get the relevant context without having to switch over to Boards.	{}	1665484117306	1665484117306	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
ay36inrifupg5jenxk1gpxsf1pc	2022-10-11 10:28:37.318817+00	cxjthfrkca3ybdpg3x4yc3n47ro	1	text	Organize and find the cards you're looking for with our filter, sort, and grouping options. From the Board header, you can quickly toggle on different properties, change the group display, set filters, and change how the cards are sorted.	{}	1665484117321	1665484117321	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
aaxu6d9kxybg178ij5zqpx58ady	2022-10-11 10:28:37.333637+00	ci5f44d3n4pn9tfgey3pnd66k3a	1	text	Views allow your team to visualize the same cards and data from different perspectives, so they can stay up-to-date in the way that works best for them. To add a new view, go to **Add a new view** from the view drop-down, then select from any of the following views:\n\n- **Board**: Adds a Kanban board, similar to this one, that allows your team to organize cards in swimlanes grouped by any property of your choosing. This view helps you visualize your project progress.\n- **Table**: Displays cards in a table format with rows and columns. Use this view to get an overview of all your project tasks. Easily view and compare the state of all properties across all cards without needing to open individual cards.\n- **Gallery**: Displays cards in a gallery format, so you can manage and organize cards with image attachments.\n- **Calendar**: Adds a calendar view to easily visualize your cards by dates and keep track of deadlines.	{}	1665484117336	1665484117335	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7pr3t3kuuhiddieftuc5oiw4siw	2022-10-11 10:28:37.19573+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	checkbox	@mention teammates so they can follow, and collaborate on, comments and descriptions	{"value":false}	1665484117198	1665484117198	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
aad84aec6apdwzqh6hiuehenyay	2022-10-11 10:28:37.209972+00	cr9iyxt9hetrcibr8u33zxjbqcw	1	text	Cards allow your entire team to manage and collaborate on a task in one place. Within a card, your team can:	{}	1665484117212	1665484117212	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
a3bz37jponjgpunmzbch7in9w1w	2022-10-11 10:28:37.224268+00	cqz3o1wudajf93d8naeadh3yjme	1	text	A board helps you manage your project, organize tasks, and collaborate with your team all in one place.	{}	1665484117226	1665484117226	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7e553jp3c57bjugt645jr3ba5oe	2022-10-11 10:28:37.239047+00	c74wyzodn1tn9jgbs4ydzmeijpc	1	image		{"fileId":"7knxbyuiedtdafcgmropgkrtybr.gif"}	1665484117241	1665484117241	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
abt4rhu1wet8qtyq3rcqqkm645e	2022-10-11 10:28:37.254354+00	c74wyzodn1tn9jgbs4ydzmeijpc	1	text	To share a board, select **Share** at the top right of the Board view. Copy the link to share the board internally with your team or generate public link that can be accessed by anyone externally.	{}	1665484117256	1665484117256	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
aupxac94k3pnezrmorqd3f43eno	2022-10-11 10:28:37.268876+00	czfmkmwczt7bi8e6o73m7wp874y	1	text	To create a new card, simply do any of the following:\n- Select "**New**" on the top right header\n- Select "**+ New**" below any column\n- Select "**+**" to the right of any columnn header	{}	1665484117271	1665484117271	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7wc8fd9957iro7x4dtikxgpmyxa	2022-10-11 10:28:37.282528+00	cnwpqrezw5fdidy55qeyx184rnh	1	image		{"fileId":"7ek6wbpp19jfoujs1goh6kttbby.gif"}	1665484117285	1665484117284	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
acdc7g8ddtfd1mjychhggr79g5o	2022-10-11 10:28:37.29639+00	cnwpqrezw5fdidy55qeyx184rnh	1	text	To share a card, you'll need to copy the card link first. You can:\n\n- Open a card and select the options menu button at the top right of the card.\n- Open the board view and hover your mouse over any card to access the options menu button.	{}	1665484117299	1665484117298	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7ciy7wejextbuzcgbnwqo4kcygo	2022-10-11 10:28:37.31138+00	cxjthfrkca3ybdpg3x4yc3n47ro	1	image		{"fileId":"7dybb6t8fj3nrdft7nerhuf784y.png"}	1665484117313	1665484117313	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7uo89x8pyg3bgj8jtxyd5uwfkua	2022-10-11 10:28:37.326187+00	ci5f44d3n4pn9tfgey3pnd66k3a	1	image		{"fileId":"78jws5m1myf8pufewzkaa6i11sc.gif"}	1665484117328	1665484117328	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7ssoad5exjffiicg78bimb9d1na	2022-10-11 10:28:37.340976+00	cy83mbaa7fj8dtbm31fkgdmc18c	1	image		{"fileId":"7d6hrtig3zt8f9cnbo1um5oxx3y.gif"}	1665484117343	1665484117343	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
7obfpazf9xigi9y8b83f1h84znh	2022-10-11 10:28:37.35512+00	cmfp91m37e38sdf9rbw698mqr9y	1	image		{"fileId":"74nt9eqzea3ydjjpgjtsxcjgrxc.gif"}	1665484117357	1665484117357	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
adewfwnr5b3fb5mofxz43c9urha	2022-10-11 10:28:37.369321+00	cmfp91m37e38sdf9rbw698mqr9y	1	text	Collaborate with teammates directly on each card using @mentions and have all the relevant context in one place.	{}	1665484117371	1665484117371	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
aegyio7cabbgg8e47afuqg9gtpe	2022-10-11 10:28:37.348295+00	cy83mbaa7fj8dtbm31fkgdmc18c	1	text	Customize cards to fit your needs and track the information most important to you. Boards supports a wide range of fully customizable property types. For example, you can:\n- Use the **Date** property for things like deadlines or milestones.\n- Assign owners to tasks with the **Person** property.\n- Define statuses and priorities with the **Select** property.\n- Create tags with the **Multi Select** property.\n- Link cards to webpages with the **URL** property.	{}	1665484117350	1665484117350	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
an8q8ombf6t8zfydkzo9km43hoe	2022-10-11 10:28:37.362316+00	cmfp91m37e38sdf9rbw698mqr9y	1	text	To mention a teammate use the **@ symbol with their username** in the comments or description section. They'll get a Direct Message notification via Channels and also be added as a [follower](https://docs.mattermost.com/boards/work-with-cards.html#receive-updates) to the card. \n\nWhenever any changes are made to the card, they'll automatically get notified on Channels.	{}	1665484117364	1665484117364	0	byqqfpiy7ofye9xwposybdcne9w	system	0	system
\.


--
-- Data for Name: focalboard_file_info; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_file_info (id, create_at, delete_at, name, extension, size, archived) FROM stdin;
\.


--
-- Data for Name: focalboard_notification_hints; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_notification_hints (block_type, block_id, workspace_id, modified_by_id, create_at, notify_at) FROM stdin;
\.


--
-- Data for Name: focalboard_schema_migrations; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_schema_migrations (version, dirty) FROM stdin;
17	f
\.


--
-- Data for Name: focalboard_sessions; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_sessions (id, token, user_id, props, create_at, update_at, auth_service) FROM stdin;
\.


--
-- Data for Name: focalboard_sharing; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_sharing (id, enabled, token, modified_by, update_at, workspace_id) FROM stdin;
\.


--
-- Data for Name: focalboard_subscriptions; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_subscriptions (block_type, block_id, workspace_id, subscriber_type, subscriber_id, notified_at, create_at, delete_at) FROM stdin;
\.


--
-- Data for Name: focalboard_system_settings; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_system_settings (id, value) FROM stdin;
UniqueIDsMigrationComplete	true
TelemetryID	76pe8gk5ubtgup8qdsoezgwx73h
\.


--
-- Data for Name: focalboard_users; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_users (id, username, email, password, mfa_secret, auth_service, auth_data, props, create_at, update_at, delete_at) FROM stdin;
\.


--
-- Data for Name: focalboard_workspaces; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_workspaces (id, signup_token, settings, modified_by, update_at) FROM stdin;
\.


--
-- Data for Name: groupchannels; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.groupchannels (groupid, autoadd, schemeadmin, createat, deleteat, updateat, channelid) FROM stdin;
\.


--
-- Data for Name: groupmembers; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.groupmembers (groupid, userid, createat, deleteat) FROM stdin;
\.


--
-- Data for Name: groupteams; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.groupteams (groupid, autoadd, schemeadmin, createat, deleteat, updateat, teamid) FROM stdin;
\.


--
-- Data for Name: incomingwebhooks; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.incomingwebhooks (id, createat, updateat, deleteat, userid, channelid, teamid, displayname, description, username, iconurl, channellocked) FROM stdin;
\.


--
-- Data for Name: ir_channelaction; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_channelaction (id, channelid, enabled, deleteat, actiontype, triggertype, payload) FROM stdin;
\.


--
-- Data for Name: ir_db_migrations; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_db_migrations (version, name) FROM stdin;
1	create_IR_system
2	create_IR_incident
\.


--
-- Data for Name: ir_incident; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_incident (id, name, description, isactive, commanderuserid, teamid, channelid, createat, endat, deleteat, activestage, postid, playbookid, checklistsjson, activestagetitle, reminderpostid, broadcastchannelid, previousreminder, remindermessagetemplate, currentstatus, reporteruserid, concatenatedinviteduserids, defaultcommanderid, announcementchannelid, concatenatedwebhookoncreationurls, concatenatedinvitedgroupids, retrospective, messageonjoin, retrospectivepublishedat, retrospectivereminderintervalseconds, retrospectivewascanceled, concatenatedwebhookonstatusupdateurls, laststatusupdateat, exportchannelonfinishedenabled, categorizechannelenabled, categoryname, concatenatedbroadcastchannelids, channelidtorootid, remindertimerdefaultseconds, statusupdateenabled, retrospectiveenabled, statusupdatebroadcastchannelsenabled, statusupdatebroadcastwebhooksenabled) FROM stdin;
\.


--
-- Data for Name: ir_metric; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_metric (incidentid, metricconfigid, value, published) FROM stdin;
\.


--
-- Data for Name: ir_metricconfig; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_metricconfig (id, playbookid, title, description, type, target, ordering, deleteat) FROM stdin;
\.


--
-- Data for Name: ir_playbook; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_playbook (id, title, description, teamid, createpublicincident, createat, deleteat, checklistsjson, numstages, numsteps, broadcastchannelid, remindermessagetemplate, remindertimerdefaultseconds, concatenatedinviteduserids, inviteusersenabled, defaultcommanderid, defaultcommanderenabled, announcementchannelid, announcementchannelenabled, concatenatedwebhookoncreationurls, webhookoncreationenabled, concatenatedinvitedgroupids, messageonjoin, messageonjoinenabled, retrospectivereminderintervalseconds, retrospectivetemplate, concatenatedwebhookonstatusupdateurls, webhookonstatusupdateenabled, concatenatedsignalanykeywords, signalanykeywordsenabled, updateat, exportchannelonfinishedenabled, categorizechannelenabled, categoryname, concatenatedbroadcastchannelids, broadcastenabled, runsummarytemplate, channelnametemplate, statusupdateenabled, retrospectiveenabled, public, runsummarytemplateenabled) FROM stdin;
\.


--
-- Data for Name: ir_playbookautofollow; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_playbookautofollow (playbookid, userid) FROM stdin;
\.


--
-- Data for Name: ir_playbookmember; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_playbookmember (playbookid, memberid, roles) FROM stdin;
\.


--
-- Data for Name: ir_run_participants; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_run_participants (userid, incidentid, isfollower) FROM stdin;
\.


--
-- Data for Name: ir_statusposts; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_statusposts (incidentid, postid) FROM stdin;
\.


--
-- Data for Name: ir_system; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_system (skey, svalue) FROM stdin;
DatabaseVersion	0.53.0
\.


--
-- Data for Name: ir_timelineevent; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_timelineevent (id, incidentid, createat, deleteat, eventat, eventtype, summary, details, postid, subjectuserid, creatoruserid) FROM stdin;
\.


--
-- Data for Name: ir_userinfo; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_userinfo (id, lastdailytododmat, digestnotificationsettingsjson) FROM stdin;
\.


--
-- Data for Name: ir_viewedchannel; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_viewedchannel (channelid, userid) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.jobs (id, type, priority, createat, startat, lastactivityat, status, progress, data) FROM stdin;
jd8n4a3jw7np3f9bhkhscdac3h	expiry_notify	0	1665493388891	1665493401588	1665493401591	success	0	null
xnr57y6awtgr7estturehti3zy	migrations	0	1665484174872	1665484189732	1665484189953	success	0	{"last_done": "{\\"current_table\\":\\"ChannelMembers\\",\\"last_team_id\\":\\"00000000000000000000000000\\",\\"last_channel_id\\":\\"00000000000000000000000000\\",\\"last_user\\":\\"00000000000000000000000000\\"}", "migration_key": "migration_advanced_permissions_phase_2"}
mnmsq9jqkpfqzq6gh5o3zidjhe	expiry_notify	0	1665484714890	1665484729804	1665484729811	success	0	null
te8sx3a7zt8emjztgscnbq9zca	expiry_notify	0	1665485314900	1665485329894	1665485329898	success	0	null
bmbcm469etb3up46eqhqrn5zqc	expiry_notify	0	1665485914912	1665485914984	1665485914988	success	0	null
7r76iz891pygjpf5kji7rwsg1e	expiry_notify	0	1665486514924	1665486515074	1665486515077	success	0	null
h49sf37anfbnzntwqrcmooy45r	expiry_notify	0	1665487114936	1665487115227	1665487115231	success	0	null
oi8huj1uityppbrdqk9k74dwth	expiry_notify	0	1665487714948	1665487715317	1665487715331	success	0	null
6iu8am1zkfysbf5c6eeu8pgbah	product_notices	0	1665487714954	1665487715317	1665487715340	success	0	null
ot51ndo5f3damefyuby89a9g3e	expiry_notify	0	1665488314985	1665488315694	1665488315707	success	0	null
78wznji6j3dg7j4w1ff4k4p4gy	expiry_notify	0	1665488915001	1665488915791	1665488915794	success	0	null
gac5b4hn7igmuesyub6ob9sg6a	expiry_notify	0	1665489515035	1665489515990	1665489515998	success	0	null
tohy49hmtbf6bcj6nnsj4sd8ry	expiry_notify	0	1665490539526	1665490551209	1665490551213	success	0	null
qk8hbjuaztn57ksne6n9kbj79c	expiry_notify	0	1665491139558	1665491151291	1665491151295	success	0	null
ad7hgsu15pyz5gfrny4uqh1msa	expiry_notify	0	1665491739577	1665491751371	1665491751375	success	0	null
pq4jzx6mj3y3umrd4yfibpz9dy	expiry_notify	0	1665492339591	1665492351454	1665492351458	success	0	null
zrgiw9z4t7ncijsrijqtzcm8xy	expiry_notify	0	1665493988903	1665494001670	1665494001673	success	0	null
yemah4iqhigetx8ua6zi93dbxe	expiry_notify	0	1665494588915	1665494601745	1665494601748	success	0	null
5d3wsz4q87818np8mtjxy7styr	expiry_notify	0	1665495188927	1665495201833	1665495201837	success	0	null
y8n4siy7gin5tew4fmk67oy34o	expiry_notify	0	1665495788941	1665495801911	1665495801914	success	0	null
847o1smz5tydpj688p1h7ejooh	expiry_notify	0	1665496388954	1665496401990	1665496402004	success	0	null
539wsm19qtyi9xaun5igewaoec	product_notices	0	1665496388960	1665496401990	1665496402008	success	0	null
\.


--
-- Data for Name: licenses; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.licenses (id, createat, bytes) FROM stdin;
\.


--
-- Data for Name: linkmetadata; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.linkmetadata (hash, url, "timestamp", type, data) FROM stdin;
\.


--
-- Data for Name: oauthaccessdata; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.oauthaccessdata (token, refreshtoken, redirecturi, clientid, userid, expiresat, scope) FROM stdin;
\.


--
-- Data for Name: oauthapps; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.oauthapps (id, creatorid, createat, updateat, clientsecret, name, description, callbackurls, homepage, istrusted, iconurl, mattermostappid) FROM stdin;
\.


--
-- Data for Name: oauthauthdata; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.oauthauthdata (clientid, userid, code, expiresin, createat, redirecturi, state, scope) FROM stdin;
\.


--
-- Data for Name: outgoingwebhooks; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.outgoingwebhooks (id, token, createat, updateat, deleteat, creatorid, channelid, teamid, triggerwords, callbackurls, displayname, contenttype, triggerwhen, username, iconurl, description) FROM stdin;
\.


--
-- Data for Name: pluginkeyvaluestore; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.pluginkeyvaluestore (pluginid, pkey, pvalue, expireat) FROM stdin;
com.mattermost.plugin-channel-export	mmi_botid	\\x37673662716a3163796a627239677462336a6563707236727977	0
com.mattermost.nps	ServerUpgrade-7.1.0	\\x7b227365727665725f76657273696f6e223a22372e312e30222c22757067726164655f6174223a22323032322d31302d31315431303a32383a33312e3539373738353734365a227d	0
com.mattermost.nps	Survey-7.1.0	\\x7b227365727665725f76657273696f6e223a22372e312e30222c226372656174655f6174223a22323032322d31302d31315431303a32383a33312e3539373738353734365a222c2273746172745f6174223a22323032322d31312d30315431303a32383a33312e3539373738353734365a227d	0
com.mattermost.apps	mmi_botid	\\x64363367646e65743470796e38637166636a6765706631633963	0
playbooks	mmi_botid	\\x6a78656439773768723364647a726b6331686d38673779726965	0
focalboard	mmi_botid	\\x6f387572786533363170796e696e72737873747a67346a646463	0
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.posts (id, createat, updateat, deleteat, userid, channelid, rootid, originalid, message, type, props, hashtags, filenames, fileids, hasreactions, editat, ispinned, remoteid) FROM stdin;
e1wdobd3w7grpyqn5oc9zn183y	1665489781334	1665489781334	0	m4tc9zbumffgd8taws1x5mts6w	iz1mrkk4c7nttrssz3etgsfi7y			kpas joined the team.	system_join_team	{"username": "kpas"}		[]	[]	f	0	f	\N
wit7w81uqtn3m84buinpo3hp5e	1665489781381	1665489781381	0	m4tc9zbumffgd8taws1x5mts6w	8iipdskgt3rbfc96nat18k36er			kpas joined the channel.	system_join_channel	{"username": "kpas"}		[]	[]	f	0	f	\N
\.


--
-- Data for Name: preferences; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.preferences (userid, category, name, value) FROM stdin;
m4tc9zbumffgd8taws1x5mts6w	tutorial_step	m4tc9zbumffgd8taws1x5mts6w	0
m4tc9zbumffgd8taws1x5mts6w	insights	insights_tutorial_state	{"insights_modal_viewed":true}
m4tc9zbumffgd8taws1x5mts6w	recommended_next_steps	hide	true
m4tc9zbumffgd8taws1x5mts6w	onboarding_task_list	onboarding_task_list_show	false
m4tc9zbumffgd8taws1x5mts6w	onboarding_task_list	onboarding_task_list_open	false
\.


--
-- Data for Name: productnoticeviewstate; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.productnoticeviewstate (userid, noticeid, viewed, "timestamp") FROM stdin;
m4tc9zbumffgd8taws1x5mts6w	use_case_survey	1	1665489773
m4tc9zbumffgd8taws1x5mts6w	june15-cloud-freemium	1	1665489773
m4tc9zbumffgd8taws1x5mts6w	desktop_upgrade_v5.1	1	1665489773
m4tc9zbumffgd8taws1x5mts6w	server_upgrade_v7.3	1	1665489773
m4tc9zbumffgd8taws1x5mts6w	crt-admin-disabled	1	1665489773
m4tc9zbumffgd8taws1x5mts6w	crt-admin-default_off	1	1665489773
m4tc9zbumffgd8taws1x5mts6w	crt-user-default-on	1	1665489773
m4tc9zbumffgd8taws1x5mts6w	crt-user-always-on	1	1665489773
m4tc9zbumffgd8taws1x5mts6w	v6.0_user_introduction	1	1665489773
m4tc9zbumffgd8taws1x5mts6w	v6.2_boards	1	1665489773
\.


--
-- Data for Name: publicchannels; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.publicchannels (id, deleteat, teamid, displayname, name, header, purpose) FROM stdin;
iz1mrkk4c7nttrssz3etgsfi7y	0	8b5ukqi7mprkiettfopbbntphr	Town Square	town-square		
8iipdskgt3rbfc96nat18k36er	0	8b5ukqi7mprkiettfopbbntphr	Off-Topic	off-topic		
\.


--
-- Data for Name: reactions; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.reactions (userid, postid, emojiname, createat, updateat, deleteat, remoteid, channelid) FROM stdin;
\.


--
-- Data for Name: recentsearches; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.recentsearches (userid, searchpointer, query, createat) FROM stdin;
\.


--
-- Data for Name: remoteclusters; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.remoteclusters (remoteid, remoteteamid, name, displayname, siteurl, createat, lastpingat, token, remotetoken, topics, creatorid) FROM stdin;
\.


--
-- Data for Name: retentionpolicies; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.retentionpolicies (id, displayname, postduration) FROM stdin;
\.


--
-- Data for Name: retentionpolicieschannels; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.retentionpolicieschannels (policyid, channelid) FROM stdin;
\.


--
-- Data for Name: retentionpoliciesteams; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.retentionpoliciesteams (policyid, teamid) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.roles (id, name, displayname, description, createat, updateat, deleteat, permissions, schememanaged, builtin) FROM stdin;
tmd4xpadqf8wjgcxzzy9uw5gwr	playbook_admin	authentication.roles.playbook_admin.name	authentication.roles.playbook_admin.description	1665484102195	1665484104139	0	 playbook_private_manage_properties playbook_public_make_private playbook_public_manage_members playbook_public_manage_roles playbook_public_manage_properties playbook_private_manage_members playbook_private_manage_roles	t	t
bh7kx7w31fr4xf8skgj9jg16zw	system_guest	authentication.roles.global_guest.name	authentication.roles.global_guest.description	1665484102160	1665484104132	0	 create_direct_channel create_group_channel	t	t
6jctbrb1bjdpjytnamhw3nh8fh	system_admin	authentication.roles.global_admin.name	authentication.roles.global_admin.description	1665484102173	1665484104142	0	 sysconsole_read_compliance_compliance_monitoring list_users_without_team invite_user read_bots recycle_database_connections manage_others_bots list_team_channels sysconsole_write_environment_smtp sysconsole_read_reporting_site_statistics edit_post sysconsole_write_billing sysconsole_read_environment_logging read_jobs manage_channel_roles sysconsole_write_environment_high_availability playbook_public_manage_members read_channel delete_others_posts remove_saml_private_cert remove_saml_idp_cert delete_public_channel create_bot sysconsole_read_environment_smtp sysconsole_write_user_management_channels sysconsole_read_user_management_channels test_ldap sysconsole_read_experimental_feature_flags manage_custom_group_members sysconsole_read_site_announcement_banner run_view sysconsole_write_compliance_compliance_export sysconsole_write_authentication_guest_access create_group_channel sysconsole_read_integrations_integration_management add_saml_private_cert sysconsole_read_site_localization get_logs sysconsole_read_reporting_team_statistics purge_bleve_indexes sysconsole_read_site_file_sharing_and_downloads edit_brand sysconsole_write_environment_push_notification_server add_ldap_public_cert create_elasticsearch_post_indexing_job download_compliance_export_result manage_jobs assign_bot sysconsole_read_site_public_links sysconsole_read_authentication_ldap sysconsole_write_integrations_integration_management read_audits sysconsole_read_site_users_and_teams add_saml_idp_cert manage_secure_connections sysconsole_read_experimental_features sysconsole_read_site_posts sysconsole_write_reporting_site_statistics demote_to_guest create_data_retention_job sysconsole_read_environment_performance_monitoring playbook_private_manage_properties sysconsole_write_site_customization manage_shared_channels read_public_channel_groups create_custom_group create_private_channel read_elasticsearch_post_aggregation_job sysconsole_write_user_management_system_roles sysconsole_read_environment_image_proxy manage_public_channel_members view_team delete_others_emojis create_direct_channel revoke_user_access_token sysconsole_write_environment_elasticsearch sysconsole_write_integrations_cors sysconsole_write_authentication_password sysconsole_write_compliance_custom_terms_of_service playbook_public_manage_roles sysconsole_read_user_management_permissions sysconsole_read_authentication_guest_access read_other_users_teams purge_elasticsearch_indexes use_group_mentions playbook_private_manage_members manage_license_information playbook_public_manage_properties sysconsole_write_site_localization join_public_teams sysconsole_write_integrations_gif remove_others_reactions invalidate_email_invite sysconsole_write_integrations_bot_accounts sysconsole_write_experimental_feature_flags manage_team_roles sysconsole_read_environment_push_notification_server manage_roles manage_system_wide_oauth manage_private_channel_members convert_private_channel_to_public sysconsole_write_plugins playbook_private_view manage_others_outgoing_webhooks sysconsole_read_environment_elasticsearch sysconsole_read_environment_web_server test_email delete_private_channel sysconsole_write_user_management_permissions manage_incoming_webhooks invite_guest sysconsole_write_site_file_sharing_and_downloads view_members create_emojis sysconsole_read_environment_developer read_ldap_sync_job sysconsole_write_environment_file_storage sysconsole_write_authentication_mfa manage_team invalidate_caches sysconsole_write_user_management_users sysconsole_read_integrations_gif sysconsole_write_compliance_compliance_monitoring sysconsole_write_reporting_team_statistics sysconsole_read_integrations_cors sysconsole_write_environment_session_lengths read_others_bots manage_bots create_post_public sysconsole_write_user_management_groups manage_oauth sysconsole_write_experimental_features create_ldap_sync_job sysconsole_write_environment_logging manage_others_incoming_webhooks sysconsole_write_site_announcement_banner use_slash_commands sysconsole_read_compliance_data_retention_policy sysconsole_write_about_edition_and_license sysconsole_read_authentication_saml remove_saml_public_cert sysconsole_read_reporting_server_logs sysconsole_write_compliance_data_retention_policy convert_public_channel_to_private upload_file create_elasticsearch_post_aggregation_job promote_guest sysconsole_read_authentication_openid sysconsole_read_site_notices sysconsole_write_authentication_signup create_compliance_export_job create_user_access_token read_data_retention_job run_manage_properties sysconsole_read_environment_file_storage read_private_channel_groups sysconsole_write_environment_database playbook_private_create list_private_teams sysconsole_write_user_management_teams add_ldap_private_cert edit_others_posts get_saml_cert_status import_team sysconsole_write_site_emoji sysconsole_write_site_public_links sysconsole_read_site_emoji sysconsole_read_environment_session_lengths read_compliance_export_job manage_public_channel_properties sysconsole_read_user_management_system_roles sysconsole_write_site_users_and_teams sysconsole_read_user_management_users read_license_information edit_other_users sysconsole_write_authentication_ldap sysconsole_read_user_management_teams reload_config sysconsole_write_reporting_server_logs read_public_channel create_post sysconsole_write_environment_performance_monitoring read_elasticsearch_post_indexing_job create_post_ephemeral create_team delete_custom_group run_manage_members add_reaction sysconsole_write_environment_web_server manage_private_channel_properties sysconsole_write_authentication_saml add_saml_public_cert edit_custom_group sysconsole_read_authentication_password sysconsole_read_environment_high_availability sysconsole_read_authentication_signup run_create sysconsole_read_authentication_mfa playbook_private_manage_roles remove_ldap_private_cert sysconsole_read_compliance_compliance_export sysconsole_read_authentication_email sysconsole_read_site_customization playbook_private_make_public get_analytics create_public_channel create_post_bleve_indexes_job get_saml_metadata_from_idp sysconsole_write_site_notifications remove_reaction test_site_url sysconsole_read_experimental_bleve manage_outgoing_webhooks add_user_to_team delete_post sysconsole_read_compliance_custom_terms_of_service read_user_access_token sysconsole_write_authentication_openid sysconsole_read_user_management_groups remove_ldap_public_cert test_s3 get_public_link playbook_public_create list_public_teams join_public_channels sysconsole_write_environment_developer remove_user_from_team sysconsole_read_environment_database manage_system sysconsole_read_integrations_bot_accounts manage_others_slash_commands sysconsole_read_environment_rate_limiting sysconsole_read_plugins manage_slash_commands playbook_public_make_private playbook_public_view join_private_teams sysconsole_write_site_notices assign_system_admin_role delete_emojis sysconsole_write_environment_rate_limiting sysconsole_write_environment_image_proxy use_channel_mentions sysconsole_write_site_posts sysconsole_read_billing sysconsole_read_about_edition_and_license sysconsole_write_experimental_bleve test_elasticsearch sysconsole_write_authentication_email sysconsole_read_site_notifications	t	t
tzunsja7bi86zf4h58bdrmnrjh	system_user_access_token	authentication.roles.system_user_access_token.name	authentication.roles.system_user_access_token.description	1665484102133	1665484104118	0	 create_user_access_token read_user_access_token revoke_user_access_token	f	t
oww5gqehzigw9b36k5iaxxqkhh	system_read_only_admin	authentication.roles.system_read_only_admin.name	authentication.roles.system_read_only_admin.description	1665484102163	1665484104134	0	 view_team read_elasticsearch_post_aggregation_job test_ldap read_channel sysconsole_read_site_notifications sysconsole_read_environment_file_storage sysconsole_read_integrations_integration_management get_analytics sysconsole_read_environment_database sysconsole_read_site_file_sharing_and_downloads sysconsole_read_site_announcement_banner sysconsole_read_environment_developer list_public_teams download_compliance_export_result sysconsole_read_environment_high_availability sysconsole_read_authentication_saml sysconsole_read_plugins sysconsole_read_user_management_channels sysconsole_read_experimental_features sysconsole_read_user_management_permissions sysconsole_read_compliance_compliance_monitoring sysconsole_read_authentication_signup read_data_retention_job sysconsole_read_site_public_links sysconsole_read_user_management_groups sysconsole_read_user_management_teams sysconsole_read_experimental_bleve sysconsole_read_reporting_server_logs sysconsole_read_site_users_and_teams read_other_users_teams sysconsole_read_site_customization sysconsole_read_compliance_data_retention_policy sysconsole_read_site_localization sysconsole_read_environment_web_server sysconsole_read_environment_elasticsearch get_logs sysconsole_read_authentication_email sysconsole_read_compliance_compliance_export sysconsole_read_environment_smtp sysconsole_read_authentication_mfa sysconsole_read_reporting_team_statistics sysconsole_read_user_management_users list_private_teams sysconsole_read_site_notices sysconsole_read_environment_session_lengths sysconsole_read_authentication_password sysconsole_read_reporting_site_statistics read_ldap_sync_job read_public_channel_groups read_compliance_export_job sysconsole_read_site_emoji read_private_channel_groups read_license_information sysconsole_read_authentication_openid sysconsole_read_site_posts read_audits read_public_channel sysconsole_read_about_edition_and_license sysconsole_read_authentication_guest_access sysconsole_read_compliance_custom_terms_of_service sysconsole_read_environment_performance_monitoring sysconsole_read_environment_logging sysconsole_read_environment_rate_limiting sysconsole_read_integrations_cors sysconsole_read_experimental_feature_flags sysconsole_read_authentication_ldap sysconsole_read_integrations_gif sysconsole_read_environment_push_notification_server read_elasticsearch_post_indexing_job sysconsole_read_environment_image_proxy sysconsole_read_integrations_bot_accounts	f	t
7bw6qituy3gb7qz5gs67wrnqte	channel_user	authentication.roles.channel_user.name	authentication.roles.channel_user.description	1665484102184	1665484104136	0	 remove_reaction use_channel_mentions edit_post use_slash_commands read_channel manage_public_channel_properties delete_private_channel manage_private_channel_members read_public_channel_groups use_group_mentions delete_public_channel manage_private_channel_properties get_public_link add_reaction manage_public_channel_members upload_file delete_post create_post read_private_channel_groups	t	t
as4i9r4hq7gujcdet6e8xuhubr	channel_admin	authentication.roles.channel_admin.name	authentication.roles.channel_admin.description	1665484102084	1665484104110	0	 use_group_mentions manage_public_channel_members read_private_channel_groups add_reaction create_post use_channel_mentions manage_private_channel_members remove_reaction manage_channel_roles read_public_channel_groups	t	t
448utah4bfyh5ezuaepbxc5f5e	team_user	authentication.roles.team_user.name	authentication.roles.team_user.description	1665484102111	1665484104111	0	 list_team_channels read_public_channel view_team playbook_public_create invite_user join_public_channels create_public_channel create_private_channel add_user_to_team playbook_private_create	t	t
jczgzioqd7bhterzfyzrzw9n4y	team_post_all	authentication.roles.team_post_all.name	authentication.roles.team_post_all.description	1665484102122	1665484104114	0	 use_channel_mentions create_post use_group_mentions	f	t
9aupe6wuctnu7nxh535s7dq1qo	custom_group_user	authentication.roles.custom_group_user.name	authentication.roles.custom_group_user.description	1665484102144	1665484104124	0		f	f
ybnn7uer4f8m8poa67myei355o	team_post_all_public	authentication.roles.team_post_all_public.name	authentication.roles.team_post_all_public.description	1665484102148	1665484104126	0	 use_group_mentions create_post_public use_channel_mentions	f	t
1bu3e43kk7r6x8gqob8g7ubk6y	team_admin	authentication.roles.team_admin.name	authentication.roles.team_admin.description	1665484102153	1665484104128	0	 convert_private_channel_to_public remove_user_from_team add_reaction use_group_mentions read_public_channel_groups use_channel_mentions manage_team manage_channel_roles manage_others_incoming_webhooks playbook_public_manage_roles playbook_private_manage_roles manage_private_channel_members manage_public_channel_members remove_reaction delete_others_posts read_private_channel_groups import_team delete_post convert_public_channel_to_private manage_outgoing_webhooks manage_team_roles create_post manage_others_slash_commands manage_incoming_webhooks manage_slash_commands manage_others_outgoing_webhooks	t	t
kzn9x64nu7gsdccj4jk3mtwx9c	run_member	authentication.roles.run_member.name	authentication.roles.run_member.description	1665484102157	1665484104130	0	 run_view	t	t
p6i9f346mt87pjnr9mni3pghjr	system_post_all_public	authentication.roles.system_post_all_public.name	authentication.roles.system_post_all_public.description	1665484102130	1665484104116	0	 use_group_mentions create_post_public use_channel_mentions	f	t
qoo8ra5crpyoprcjmeafbf3cyy	system_user_manager	authentication.roles.system_user_manager.name	authentication.roles.system_user_manager.description	1665484102137	1665484104120	0	 read_public_channel list_private_teams sysconsole_read_user_management_groups manage_public_channel_properties sysconsole_read_authentication_saml add_user_to_team manage_public_channel_members join_private_teams manage_team_roles manage_team remove_user_from_team sysconsole_write_user_management_teams sysconsole_write_user_management_channels sysconsole_write_user_management_groups delete_public_channel sysconsole_read_authentication_mfa view_team read_private_channel_groups manage_channel_roles convert_public_channel_to_private read_channel sysconsole_read_user_management_channels read_ldap_sync_job delete_private_channel sysconsole_read_user_management_teams manage_private_channel_members sysconsole_read_authentication_email read_public_channel_groups sysconsole_read_authentication_guest_access sysconsole_read_authentication_openid join_public_teams sysconsole_read_user_management_permissions manage_private_channel_properties sysconsole_read_authentication_signup test_ldap list_public_teams sysconsole_read_authentication_password convert_private_channel_to_public sysconsole_read_authentication_ldap	f	t
rtycphbajpruudabn98tik7uqy	playbook_member	authentication.roles.playbook_member.name	authentication.roles.playbook_member.description	1665484102215	1665484104144	0	 playbook_private_manage_properties run_create playbook_public_view playbook_public_manage_members playbook_public_manage_properties playbook_private_view playbook_private_manage_members	t	t
fgryqyjcpir9zm66pmdy58hguc	run_admin	authentication.roles.run_admin.name	authentication.roles.run_admin.description	1665484102225	1665484104146	0	 run_manage_members run_manage_properties	t	t
o1o43stxt7d87q4198wxjns4oc	channel_guest	authentication.roles.channel_guest.name	authentication.roles.channel_guest.description	1665484102243	1665484104148	0	 read_channel add_reaction remove_reaction upload_file edit_post create_post use_channel_mentions use_slash_commands	t	t
gpj38ja8p3dhjfx3hpyongrfdw	team_guest	authentication.roles.team_guest.name	authentication.roles.team_guest.description	1665484102254	1665484104150	0	 view_team	t	t
5ogzei9oiifj9br99msdyxrjio	system_post_all	authentication.roles.system_post_all.name	authentication.roles.system_post_all.description	1665484102274	1665484104152	0	 create_post use_group_mentions use_channel_mentions	f	t
157pgfi9epnb8x6wm9wx8qokre	system_user	authentication.roles.global_user.name	authentication.roles.global_user.description	1665484102126	1665484104154	0	 list_public_teams create_emojis manage_custom_group_members view_members edit_custom_group delete_custom_group join_public_teams create_custom_group delete_emojis create_group_channel create_direct_channel create_team	t	t
c963xam6ft85fmrxk37eiytpte	system_manager	authentication.roles.system_manager.name	authentication.roles.system_manager.description	1665484102141	1665484104122	0	 sysconsole_read_site_customization sysconsole_read_environment_smtp read_public_channel sysconsole_read_environment_web_server test_site_url sysconsole_write_integrations_integration_management sysconsole_read_site_users_and_teams manage_channel_roles sysconsole_read_authentication_saml sysconsole_read_reporting_server_logs read_ldap_sync_job sysconsole_write_user_management_teams sysconsole_write_environment_performance_monitoring sysconsole_write_site_file_sharing_and_downloads add_user_to_team sysconsole_read_user_management_teams sysconsole_write_environment_push_notification_server get_logs create_elasticsearch_post_indexing_job read_public_channel_groups sysconsole_read_integrations_gif sysconsole_write_site_notifications sysconsole_write_site_posts delete_public_channel list_private_teams sysconsole_read_user_management_permissions convert_public_channel_to_private purge_elasticsearch_indexes remove_user_from_team sysconsole_read_environment_high_availability manage_public_channel_properties sysconsole_write_integrations_bot_accounts sysconsole_read_site_public_links sysconsole_read_authentication_guest_access sysconsole_read_authentication_password sysconsole_read_site_file_sharing_and_downloads sysconsole_read_reporting_site_statistics sysconsole_write_environment_web_server sysconsole_read_environment_image_proxy sysconsole_write_integrations_cors sysconsole_read_plugins sysconsole_read_environment_logging sysconsole_read_integrations_cors sysconsole_read_environment_session_lengths sysconsole_read_user_management_channels sysconsole_read_environment_file_storage sysconsole_read_environment_performance_monitoring reload_config sysconsole_read_authentication_openid sysconsole_read_authentication_email sysconsole_read_authentication_signup sysconsole_read_environment_database test_s3 manage_private_channel_members sysconsole_write_site_users_and_teams sysconsole_write_user_management_groups sysconsole_write_site_localization list_public_teams sysconsole_read_user_management_groups get_analytics sysconsole_write_site_customization sysconsole_read_site_notifications sysconsole_write_environment_smtp sysconsole_read_site_announcement_banner manage_team_roles read_elasticsearch_post_indexing_job read_private_channel_groups sysconsole_write_environment_file_storage sysconsole_write_user_management_channels sysconsole_write_environment_rate_limiting test_elasticsearch sysconsole_read_integrations_bot_accounts manage_public_channel_members sysconsole_read_site_posts sysconsole_read_environment_developer sysconsole_read_authentication_ldap recycle_database_connections read_channel sysconsole_read_reporting_team_statistics sysconsole_write_site_announcement_banner sysconsole_write_environment_session_lengths sysconsole_read_environment_elasticsearch sysconsole_write_site_notices read_elasticsearch_post_aggregation_job sysconsole_read_site_notices manage_private_channel_properties invalidate_caches sysconsole_write_site_emoji create_elasticsearch_post_aggregation_job sysconsole_read_environment_rate_limiting test_email sysconsole_read_about_edition_and_license sysconsole_write_environment_image_proxy sysconsole_write_integrations_gif sysconsole_read_integrations_integration_management sysconsole_write_site_public_links join_public_teams test_ldap sysconsole_write_environment_developer view_team sysconsole_write_environment_database read_license_information convert_private_channel_to_public sysconsole_write_environment_elasticsearch sysconsole_read_site_emoji sysconsole_write_environment_high_availability sysconsole_write_environment_logging delete_private_channel sysconsole_read_environment_push_notification_server join_private_teams sysconsole_read_site_localization manage_team sysconsole_read_authentication_mfa sysconsole_write_user_management_permissions edit_brand	f	t
\.


--
-- Data for Name: schemes; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.schemes (id, name, displayname, description, createat, updateat, deleteat, scope, defaultteamadminrole, defaultteamuserrole, defaultchanneladminrole, defaultchanneluserrole, defaultteamguestrole, defaultchannelguestrole, defaultplaybookadminrole, defaultplaybookmemberrole, defaultrunadminrole, defaultrunmemberrole) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.sessions (id, token, createat, expiresat, lastactivityat, userid, deviceid, roles, isoauth, props, expirednotify) FROM stdin;
u4bg7buy3j8f3p641gj7nmombo	p7ssmdyucfnd9r87wjzw4ua5iw	1665489773593	1668081773593	1665489773593	m4tc9zbumffgd8taws1x5mts6w		system_admin system_user	f	{"os": "Linux", "csrf": "wpjg6tmygjymfc7oz363fos45a", "isSaml": "false", "browser": "Firefox/91.0", "isMobile": "false", "is_guest": "false", "platform": "Linux", "isOAuthUser": "false"}	f
\.


--
-- Data for Name: sharedchannelattachments; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.sharedchannelattachments (id, fileid, remoteid, createat, lastsyncat) FROM stdin;
\.


--
-- Data for Name: sharedchannelremotes; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.sharedchannelremotes (id, channelid, creatorid, createat, updateat, isinviteaccepted, isinviteconfirmed, remoteid, lastpostupdateat, lastpostid) FROM stdin;
\.


--
-- Data for Name: sharedchannels; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.sharedchannels (channelid, teamid, home, readonly, sharename, sharedisplayname, sharepurpose, shareheader, creatorid, createat, updateat, remoteid) FROM stdin;
\.


--
-- Data for Name: sharedchannelusers; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.sharedchannelusers (id, userid, remoteid, createat, lastsyncat, channelid) FROM stdin;
\.


--
-- Data for Name: sidebarcategories; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.sidebarcategories (id, userid, teamid, sortorder, sorting, type, displayname, muted, collapsed) FROM stdin;
favorites_m4tc9zbumffgd8taws1x5mts6w_8b5ukqi7mprkiettfopbbntphr	m4tc9zbumffgd8taws1x5mts6w	8b5ukqi7mprkiettfopbbntphr	0		favorites	Favorites	f	f
channels_m4tc9zbumffgd8taws1x5mts6w_8b5ukqi7mprkiettfopbbntphr	m4tc9zbumffgd8taws1x5mts6w	8b5ukqi7mprkiettfopbbntphr	10		channels	Channels	f	f
direct_messages_m4tc9zbumffgd8taws1x5mts6w_8b5ukqi7mprkiettfopbbntphr	m4tc9zbumffgd8taws1x5mts6w	8b5ukqi7mprkiettfopbbntphr	20	recent	direct_messages	Direct Messages	f	f
\.


--
-- Data for Name: sidebarchannels; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.sidebarchannels (channelid, userid, categoryid, sortorder) FROM stdin;
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.status (userid, status, manual, lastactivityat, dndendtime, prevstatus) FROM stdin;
m4tc9zbumffgd8taws1x5mts6w	away	f	1665489796485	0	
\.


--
-- Data for Name: systems; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.systems (name, value) FROM stdin;
CRTChannelMembershipCountsMigrationComplete	true
CRTThreadCountsAndUnreadsMigrationComplete	true
DiagnosticId	uah1gq4x3jg5iyooohuyuce5hr
LastSecurityTime	1665484102109
FirstServerRunTimestamp	1665484102112
AdvancedPermissionsMigrationComplete	true
EmojisPermissionsMigrationComplete	true
GuestRolesCreationMigrationComplete	true
SystemConsoleRolesCreationMigrationComplete	true
emoji_permissions_split	true
webhook_permissions_split	true
list_join_public_private_teams	true
remove_permanent_delete_user	true
add_bot_permissions	true
apply_channel_manage_delete_to_channel_user	true
remove_channel_manage_delete_from_team_user	true
view_members_new_permission	true
add_manage_guests_permissions	true
channel_moderations_permissions	true
add_use_group_mentions_permission	true
add_system_console_permissions	true
add_convert_channel_permissions	true
manage_shared_channel_permissions	true
manage_secure_connections_permissions	true
add_system_roles_permissions	true
add_billing_permissions	true
download_compliance_export_results	true
experimental_subsection_permissions	true
authentication_subsection_permissions	true
integrations_subsection_permissions	true
site_subsection_permissions	true
compliance_subsection_permissions	true
environment_subsection_permissions	true
about_subsection_permissions	true
reporting_subsection_permissions	true
test_email_ancillary_permission	true
playbooks_permissions	true
custom_groups_permissions	true
playbooks_manage_roles	true
ContentExtractionConfigDefaultTrueMigrationComplete	true
PlaybookRolesCreationMigrationComplete	true
RemainingSchemaMigrations	true
AsymmetricSigningKey	{"ecdsa_key":{"curve":"P-256","x":32520701558483320648240580855461263650804179024245546407144928653089144764475,"y":45850518141871976950953264326517105792338217142543485476208797121302816512554,"d":18947853668321057414839007316055700757810821778793046986668376067890904484416}}
PostActionCookieSecret	{"key":"CuTYN4/L3Do6PkLOFOPb5ww4OvJiVD2y9utheib6Vys="}
InstallationDate	1665484110971
migration_advanced_permissions_phase_2	true
\.


--
-- Data for Name: teammembers; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.teammembers (teamid, userid, roles, deleteat, schemeuser, schemeadmin, schemeguest) FROM stdin;
8b5ukqi7mprkiettfopbbntphr	m4tc9zbumffgd8taws1x5mts6w		0	t	t	f
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.teams (id, createat, updateat, deleteat, displayname, name, description, email, type, companyname, alloweddomains, inviteid, schemeid, allowopeninvite, lastteamiconupdate, groupconstrained, cloudlimitsarchived) FROM stdin;
8b5ukqi7mprkiettfopbbntphr	1665489781249	1665489781249	0	test	test		x@y.com	O			d5y5mzpfatr1iqzi5iojy53t1e	\N	f	0	\N	f
\.


--
-- Data for Name: termsofservice; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.termsofservice (id, createat, userid, text) FROM stdin;
\.


--
-- Data for Name: threadmemberships; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.threadmemberships (postid, userid, following, lastviewed, lastupdated, unreadmentions) FROM stdin;
\.


--
-- Data for Name: threads; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.threads (postid, replycount, lastreplyat, participants, channelid, threaddeleteat) FROM stdin;
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.tokens (token, createat, type, extra) FROM stdin;
\.


--
-- Data for Name: uploadsessions; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.uploadsessions (id, type, createat, userid, channelid, filename, path, filesize, fileoffset, remoteid, reqfileid) FROM stdin;
\.


--
-- Data for Name: useraccesstokens; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.useraccesstokens (id, token, userid, description, isactive) FROM stdin;
\.


--
-- Data for Name: usergroups; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.usergroups (id, name, displayname, description, source, remoteid, createat, updateat, deleteat, allowreference) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.users (id, createat, updateat, deleteat, username, password, authdata, authservice, email, emailverified, nickname, firstname, lastname, roles, allowmarketing, props, notifyprops, lastpasswordupdate, lastpictureupdate, failedattempts, locale, mfaactive, mfasecret, "position", timezone, remoteid) FROM stdin;
7g6bqj1cyjbr9gtb3jecpr6ryw	1665484110971	1665484110971	0	channelexport		\N		channelexport@localhost	f		Channel Export Bot		system_user	f	{}	{"push": "mention", "email": "true", "channel": "true", "desktop": "mention", "comments": "never", "first_name": "false", "push_status": "away", "mention_keys": "", "push_threads": "all", "desktop_sound": "true", "email_threads": "all", "desktop_threads": "all"}	1665484110971	0	0	en	f			{"manualTimezone": "", "automaticTimezone": "", "useAutomaticTimezone": "true"}	\N
ezfs69k173nau8egif17mpa65w	1665484111295	1665484111535	0	feedbackbot		\N		feedbackbot@localhost	f		Feedbackbot		system_user	f	{}	{"push": "mention", "email": "true", "channel": "true", "desktop": "mention", "comments": "never", "first_name": "false", "push_status": "away", "mention_keys": "", "push_threads": "all", "desktop_sound": "true", "email_threads": "all", "desktop_threads": "all"}	1665484111295	1665484111535	0	en	f			{"manualTimezone": "", "automaticTimezone": "", "useAutomaticTimezone": "true"}	\N
d63gdnet4pyn8cqfcjgepf1c9c	1665484113272	1665484113360	0	appsbot		\N		appsbot@localhost	f		Mattermost Apps		system_user	f	{}	{"push": "mention", "email": "true", "channel": "true", "desktop": "mention", "comments": "never", "first_name": "false", "push_status": "away", "mention_keys": "", "push_threads": "all", "desktop_sound": "true", "email_threads": "all", "desktop_threads": "all"}	1665484113272	1665484113360	0	en	f			{"manualTimezone": "", "automaticTimezone": "", "useAutomaticTimezone": "true"}	\N
jxed9w7hr3ddzrkc1hm8g7yrie	1665484114793	1665484114816	0	playbooks		\N		playbooks@localhost	f		Playbooks		system_user	f	{}	{"push": "mention", "email": "true", "channel": "true", "desktop": "mention", "comments": "never", "first_name": "false", "push_status": "away", "mention_keys": "", "push_threads": "all", "desktop_sound": "true", "email_threads": "all", "desktop_threads": "all"}	1665484114793	1665484114816	0	en	f			{"manualTimezone": "", "automaticTimezone": "", "useAutomaticTimezone": "true"}	\N
o8urxe361pyninrsxstzg4jddc	1665484115628	1665484115628	0	boards		\N		boards@localhost	f		Boards		system_user	f	{}	{"push": "mention", "email": "true", "channel": "true", "desktop": "mention", "comments": "never", "first_name": "false", "push_status": "away", "mention_keys": "", "push_threads": "all", "desktop_sound": "true", "email_threads": "all", "desktop_threads": "all"}	1665484115628	0	0	en	f			{"manualTimezone": "", "automaticTimezone": "", "useAutomaticTimezone": "true"}	\N
m4tc9zbumffgd8taws1x5mts6w	1665489773293	1665489781294	0	kpas	$2a$10$oZj0tziixpS/fgIn/ugUMOvG7ouP3NhXaCSttHrATtcXTImrrdfHi	\N		x@y.com	f				system_admin system_user	t	{}	{"push": "mention", "email": "true", "channel": "true", "desktop": "mention", "comments": "never", "first_name": "false", "push_status": "away", "mention_keys": "", "push_threads": "all", "desktop_sound": "true", "email_threads": "all", "desktop_threads": "all"}	1665489773293	0	0	en	f			{"manualTimezone": "", "automaticTimezone": "Europe/Zurich", "useAutomaticTimezone": "true"}	\N
\.


--
-- Data for Name: usertermsofservice; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.usertermsofservice (userid, termsofserviceid, createat) FROM stdin;
\.


--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: bots bots_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.bots
    ADD CONSTRAINT bots_pkey PRIMARY KEY (userid);


--
-- Name: channelmemberhistory channelmemberhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.channelmemberhistory
    ADD CONSTRAINT channelmemberhistory_pkey PRIMARY KEY (channelid, userid, jointime);


--
-- Name: channelmembers channelmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.channelmembers
    ADD CONSTRAINT channelmembers_pkey PRIMARY KEY (channelid, userid);


--
-- Name: channels channels_name_teamid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.channels
    ADD CONSTRAINT channels_name_teamid_key UNIQUE (name, teamid);


--
-- Name: channels channels_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.channels
    ADD CONSTRAINT channels_pkey PRIMARY KEY (id);


--
-- Name: clusterdiscovery clusterdiscovery_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.clusterdiscovery
    ADD CONSTRAINT clusterdiscovery_pkey PRIMARY KEY (id);


--
-- Name: commands commands_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.commands
    ADD CONSTRAINT commands_pkey PRIMARY KEY (id);


--
-- Name: commandwebhooks commandwebhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.commandwebhooks
    ADD CONSTRAINT commandwebhooks_pkey PRIMARY KEY (id);


--
-- Name: compliances compliances_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.compliances
    ADD CONSTRAINT compliances_pkey PRIMARY KEY (id);


--
-- Name: db_lock db_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.db_lock
    ADD CONSTRAINT db_lock_pkey PRIMARY KEY (id);


--
-- Name: db_migrations db_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.db_migrations
    ADD CONSTRAINT db_migrations_pkey PRIMARY KEY (version);


--
-- Name: emoji emoji_name_deleteat_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.emoji
    ADD CONSTRAINT emoji_name_deleteat_key UNIQUE (name, deleteat);


--
-- Name: emoji emoji_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.emoji
    ADD CONSTRAINT emoji_pkey PRIMARY KEY (id);


--
-- Name: fileinfo fileinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.fileinfo
    ADD CONSTRAINT fileinfo_pkey PRIMARY KEY (id);


--
-- Name: focalboard_blocks_history focalboard_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_blocks_history
    ADD CONSTRAINT focalboard_blocks_pkey PRIMARY KEY (id, insert_at);


--
-- Name: focalboard_blocks focalboard_blocks_pkey1; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_blocks
    ADD CONSTRAINT focalboard_blocks_pkey1 PRIMARY KEY (workspace_id, id);


--
-- Name: focalboard_notification_hints focalboard_notification_hints_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_notification_hints
    ADD CONSTRAINT focalboard_notification_hints_pkey PRIMARY KEY (block_id);


--
-- Name: focalboard_schema_migrations focalboard_schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_schema_migrations
    ADD CONSTRAINT focalboard_schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: focalboard_sessions focalboard_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_sessions
    ADD CONSTRAINT focalboard_sessions_pkey PRIMARY KEY (id);


--
-- Name: focalboard_sharing focalboard_sharing_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_sharing
    ADD CONSTRAINT focalboard_sharing_pkey PRIMARY KEY (id);


--
-- Name: focalboard_subscriptions focalboard_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_subscriptions
    ADD CONSTRAINT focalboard_subscriptions_pkey PRIMARY KEY (block_id, subscriber_id);


--
-- Name: focalboard_system_settings focalboard_system_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_system_settings
    ADD CONSTRAINT focalboard_system_settings_pkey PRIMARY KEY (id);


--
-- Name: focalboard_users focalboard_users_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_users
    ADD CONSTRAINT focalboard_users_pkey PRIMARY KEY (id);


--
-- Name: focalboard_workspaces focalboard_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_workspaces
    ADD CONSTRAINT focalboard_workspaces_pkey PRIMARY KEY (id);


--
-- Name: groupchannels groupchannels_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.groupchannels
    ADD CONSTRAINT groupchannels_pkey PRIMARY KEY (groupid, channelid);


--
-- Name: groupmembers groupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.groupmembers
    ADD CONSTRAINT groupmembers_pkey PRIMARY KEY (groupid, userid);


--
-- Name: groupteams groupteams_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.groupteams
    ADD CONSTRAINT groupteams_pkey PRIMARY KEY (groupid, teamid);


--
-- Name: incomingwebhooks incomingwebhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.incomingwebhooks
    ADD CONSTRAINT incomingwebhooks_pkey PRIMARY KEY (id);


--
-- Name: ir_channelaction ir_channelaction_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_channelaction
    ADD CONSTRAINT ir_channelaction_pkey PRIMARY KEY (id);


--
-- Name: ir_db_migrations ir_db_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_db_migrations
    ADD CONSTRAINT ir_db_migrations_pkey PRIMARY KEY (version);


--
-- Name: ir_incident ir_incident_channelid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_incident
    ADD CONSTRAINT ir_incident_channelid_key UNIQUE (channelid);


--
-- Name: ir_incident ir_incident_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_incident
    ADD CONSTRAINT ir_incident_pkey PRIMARY KEY (id);


--
-- Name: ir_metric ir_metric_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_metric
    ADD CONSTRAINT ir_metric_pkey PRIMARY KEY (incidentid, metricconfigid);


--
-- Name: ir_metricconfig ir_metricconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_metricconfig
    ADD CONSTRAINT ir_metricconfig_pkey PRIMARY KEY (id);


--
-- Name: ir_playbook ir_playbook_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_playbook
    ADD CONSTRAINT ir_playbook_pkey PRIMARY KEY (id);


--
-- Name: ir_playbookautofollow ir_playbookautofollow_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_playbookautofollow
    ADD CONSTRAINT ir_playbookautofollow_pkey PRIMARY KEY (playbookid, userid);


--
-- Name: ir_playbookmember ir_playbookmember_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_playbookmember
    ADD CONSTRAINT ir_playbookmember_pkey PRIMARY KEY (memberid, playbookid);


--
-- Name: ir_playbookmember ir_playbookmember_playbookid_memberid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_playbookmember
    ADD CONSTRAINT ir_playbookmember_playbookid_memberid_key UNIQUE (playbookid, memberid);


--
-- Name: ir_run_participants ir_run_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_run_participants
    ADD CONSTRAINT ir_run_participants_pkey PRIMARY KEY (incidentid, userid);


--
-- Name: ir_statusposts ir_statusposts_incidentid_postid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_statusposts
    ADD CONSTRAINT ir_statusposts_incidentid_postid_key UNIQUE (incidentid, postid);


--
-- Name: ir_statusposts ir_statusposts_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_statusposts
    ADD CONSTRAINT ir_statusposts_pkey PRIMARY KEY (incidentid, postid);


--
-- Name: ir_system ir_system_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_system
    ADD CONSTRAINT ir_system_pkey PRIMARY KEY (skey);


--
-- Name: ir_timelineevent ir_timelineevent_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_timelineevent
    ADD CONSTRAINT ir_timelineevent_pkey PRIMARY KEY (id);


--
-- Name: ir_userinfo ir_userinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_userinfo
    ADD CONSTRAINT ir_userinfo_pkey PRIMARY KEY (id);


--
-- Name: ir_viewedchannel ir_viewedchannel_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_viewedchannel
    ADD CONSTRAINT ir_viewedchannel_pkey PRIMARY KEY (channelid, userid);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: licenses licenses_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.licenses
    ADD CONSTRAINT licenses_pkey PRIMARY KEY (id);


--
-- Name: linkmetadata linkmetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.linkmetadata
    ADD CONSTRAINT linkmetadata_pkey PRIMARY KEY (hash);


--
-- Name: oauthaccessdata oauthaccessdata_clientid_userid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.oauthaccessdata
    ADD CONSTRAINT oauthaccessdata_clientid_userid_key UNIQUE (clientid, userid);


--
-- Name: oauthaccessdata oauthaccessdata_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.oauthaccessdata
    ADD CONSTRAINT oauthaccessdata_pkey PRIMARY KEY (token);


--
-- Name: oauthapps oauthapps_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.oauthapps
    ADD CONSTRAINT oauthapps_pkey PRIMARY KEY (id);


--
-- Name: oauthauthdata oauthauthdata_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.oauthauthdata
    ADD CONSTRAINT oauthauthdata_pkey PRIMARY KEY (code);


--
-- Name: outgoingwebhooks outgoingwebhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.outgoingwebhooks
    ADD CONSTRAINT outgoingwebhooks_pkey PRIMARY KEY (id);


--
-- Name: pluginkeyvaluestore pluginkeyvaluestore_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.pluginkeyvaluestore
    ADD CONSTRAINT pluginkeyvaluestore_pkey PRIMARY KEY (pluginid, pkey);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: preferences preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.preferences
    ADD CONSTRAINT preferences_pkey PRIMARY KEY (userid, category, name);


--
-- Name: productnoticeviewstate productnoticeviewstate_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.productnoticeviewstate
    ADD CONSTRAINT productnoticeviewstate_pkey PRIMARY KEY (userid, noticeid);


--
-- Name: publicchannels publicchannels_name_teamid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.publicchannels
    ADD CONSTRAINT publicchannels_name_teamid_key UNIQUE (name, teamid);


--
-- Name: publicchannels publicchannels_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.publicchannels
    ADD CONSTRAINT publicchannels_pkey PRIMARY KEY (id);


--
-- Name: reactions reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.reactions
    ADD CONSTRAINT reactions_pkey PRIMARY KEY (postid, userid, emojiname);


--
-- Name: recentsearches recentsearches_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.recentsearches
    ADD CONSTRAINT recentsearches_pkey PRIMARY KEY (userid, searchpointer);


--
-- Name: remoteclusters remoteclusters_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.remoteclusters
    ADD CONSTRAINT remoteclusters_pkey PRIMARY KEY (remoteid, name);


--
-- Name: retentionpolicies retentionpolicies_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.retentionpolicies
    ADD CONSTRAINT retentionpolicies_pkey PRIMARY KEY (id);


--
-- Name: retentionpolicieschannels retentionpolicieschannels_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.retentionpolicieschannels
    ADD CONSTRAINT retentionpolicieschannels_pkey PRIMARY KEY (channelid);


--
-- Name: retentionpoliciesteams retentionpoliciesteams_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.retentionpoliciesteams
    ADD CONSTRAINT retentionpoliciesteams_pkey PRIMARY KEY (teamid);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schemes schemes_name_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.schemes
    ADD CONSTRAINT schemes_name_key UNIQUE (name);


--
-- Name: schemes schemes_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.schemes
    ADD CONSTRAINT schemes_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sharedchannelattachments sharedchannelattachments_fileid_remoteid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannelattachments
    ADD CONSTRAINT sharedchannelattachments_fileid_remoteid_key UNIQUE (fileid, remoteid);


--
-- Name: sharedchannelattachments sharedchannelattachments_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannelattachments
    ADD CONSTRAINT sharedchannelattachments_pkey PRIMARY KEY (id);


--
-- Name: sharedchannelremotes sharedchannelremotes_channelid_remoteid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannelremotes
    ADD CONSTRAINT sharedchannelremotes_channelid_remoteid_key UNIQUE (channelid, remoteid);


--
-- Name: sharedchannelremotes sharedchannelremotes_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannelremotes
    ADD CONSTRAINT sharedchannelremotes_pkey PRIMARY KEY (id, channelid);


--
-- Name: sharedchannels sharedchannels_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannels
    ADD CONSTRAINT sharedchannels_pkey PRIMARY KEY (channelid);


--
-- Name: sharedchannels sharedchannels_sharename_teamid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannels
    ADD CONSTRAINT sharedchannels_sharename_teamid_key UNIQUE (sharename, teamid);


--
-- Name: sharedchannelusers sharedchannelusers_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannelusers
    ADD CONSTRAINT sharedchannelusers_pkey PRIMARY KEY (id);


--
-- Name: sharedchannelusers sharedchannelusers_userid_channelid_remoteid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannelusers
    ADD CONSTRAINT sharedchannelusers_userid_channelid_remoteid_key UNIQUE (userid, channelid, remoteid);


--
-- Name: sidebarcategories sidebarcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sidebarcategories
    ADD CONSTRAINT sidebarcategories_pkey PRIMARY KEY (id);


--
-- Name: sidebarchannels sidebarchannels_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sidebarchannels
    ADD CONSTRAINT sidebarchannels_pkey PRIMARY KEY (channelid, userid, categoryid);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (userid);


--
-- Name: systems systems_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_pkey PRIMARY KEY (name);


--
-- Name: teammembers teammembers_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.teammembers
    ADD CONSTRAINT teammembers_pkey PRIMARY KEY (teamid, userid);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: termsofservice termsofservice_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.termsofservice
    ADD CONSTRAINT termsofservice_pkey PRIMARY KEY (id);


--
-- Name: threadmemberships threadmemberships_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.threadmemberships
    ADD CONSTRAINT threadmemberships_pkey PRIMARY KEY (postid, userid);


--
-- Name: threads threads_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.threads
    ADD CONSTRAINT threads_pkey PRIMARY KEY (postid);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (token);


--
-- Name: uploadsessions uploadsessions_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.uploadsessions
    ADD CONSTRAINT uploadsessions_pkey PRIMARY KEY (id);


--
-- Name: useraccesstokens useraccesstokens_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.useraccesstokens
    ADD CONSTRAINT useraccesstokens_pkey PRIMARY KEY (id);


--
-- Name: useraccesstokens useraccesstokens_token_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.useraccesstokens
    ADD CONSTRAINT useraccesstokens_token_key UNIQUE (token);


--
-- Name: usergroups usergroups_name_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.usergroups
    ADD CONSTRAINT usergroups_name_key UNIQUE (name);


--
-- Name: usergroups usergroups_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.usergroups
    ADD CONSTRAINT usergroups_pkey PRIMARY KEY (id);


--
-- Name: usergroups usergroups_source_remoteid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.usergroups
    ADD CONSTRAINT usergroups_source_remoteid_key UNIQUE (source, remoteid);


--
-- Name: users users_authdata_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_authdata_key UNIQUE (authdata);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: usertermsofservice usertermsofservice_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.usertermsofservice
    ADD CONSTRAINT usertermsofservice_pkey PRIMARY KEY (userid);


--
-- Name: idx_audits_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_audits_user_id ON public.audits USING btree (userid);


--
-- Name: idx_channel_search_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channel_search_txt ON public.channels USING gin (to_tsvector('english'::regconfig, (((((name)::text || ' '::text) || (displayname)::text) || ' '::text) || (purpose)::text)));


--
-- Name: idx_channelmembers_channel_id_scheme_guest_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channelmembers_channel_id_scheme_guest_user_id ON public.channelmembers USING btree (channelid, schemeguest, userid);


--
-- Name: idx_channelmembers_user_id_channel_id_last_viewed_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channelmembers_user_id_channel_id_last_viewed_at ON public.channelmembers USING btree (userid, channelid, lastviewedat);


--
-- Name: idx_channels_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_create_at ON public.channels USING btree (createat);


--
-- Name: idx_channels_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_delete_at ON public.channels USING btree (deleteat);


--
-- Name: idx_channels_displayname_lower; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_displayname_lower ON public.channels USING btree (lower((displayname)::text));


--
-- Name: idx_channels_name_lower; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_name_lower ON public.channels USING btree (lower((name)::text));


--
-- Name: idx_channels_scheme_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_scheme_id ON public.channels USING btree (schemeid);


--
-- Name: idx_channels_team_id_display_name; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_team_id_display_name ON public.channels USING btree (teamid, displayname);


--
-- Name: idx_channels_team_id_type; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_team_id_type ON public.channels USING btree (teamid, type);


--
-- Name: idx_channels_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_update_at ON public.channels USING btree (updateat);


--
-- Name: idx_command_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_command_create_at ON public.commands USING btree (createat);


--
-- Name: idx_command_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_command_delete_at ON public.commands USING btree (deleteat);


--
-- Name: idx_command_team_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_command_team_id ON public.commands USING btree (teamid);


--
-- Name: idx_command_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_command_update_at ON public.commands USING btree (updateat);


--
-- Name: idx_command_webhook_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_command_webhook_create_at ON public.commandwebhooks USING btree (createat);


--
-- Name: idx_emoji_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_emoji_create_at ON public.emoji USING btree (createat);


--
-- Name: idx_emoji_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_emoji_delete_at ON public.emoji USING btree (deleteat);


--
-- Name: idx_emoji_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_emoji_update_at ON public.emoji USING btree (updateat);


--
-- Name: idx_fileinfo_content_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_content_txt ON public.fileinfo USING gin (to_tsvector('english'::regconfig, content));


--
-- Name: idx_fileinfo_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_create_at ON public.fileinfo USING btree (createat);


--
-- Name: idx_fileinfo_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_delete_at ON public.fileinfo USING btree (deleteat);


--
-- Name: idx_fileinfo_extension_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_extension_at ON public.fileinfo USING btree (extension);


--
-- Name: idx_fileinfo_name_splitted; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_name_splitted ON public.fileinfo USING gin (to_tsvector('english'::regconfig, translate((name)::text, '.,-'::text, '   '::text)));


--
-- Name: idx_fileinfo_name_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_name_txt ON public.fileinfo USING gin (to_tsvector('english'::regconfig, (name)::text));


--
-- Name: idx_fileinfo_postid_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_postid_at ON public.fileinfo USING btree (postid);


--
-- Name: idx_fileinfo_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_update_at ON public.fileinfo USING btree (updateat);


--
-- Name: idx_groupchannels_channelid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_groupchannels_channelid ON public.groupchannels USING btree (channelid);


--
-- Name: idx_groupchannels_schemeadmin; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_groupchannels_schemeadmin ON public.groupchannels USING btree (schemeadmin);


--
-- Name: idx_groupmembers_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_groupmembers_create_at ON public.groupmembers USING btree (createat);


--
-- Name: idx_groupteams_schemeadmin; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_groupteams_schemeadmin ON public.groupteams USING btree (schemeadmin);


--
-- Name: idx_groupteams_teamid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_groupteams_teamid ON public.groupteams USING btree (teamid);


--
-- Name: idx_incoming_webhook_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_incoming_webhook_create_at ON public.incomingwebhooks USING btree (createat);


--
-- Name: idx_incoming_webhook_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_incoming_webhook_delete_at ON public.incomingwebhooks USING btree (deleteat);


--
-- Name: idx_incoming_webhook_team_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_incoming_webhook_team_id ON public.incomingwebhooks USING btree (teamid);


--
-- Name: idx_incoming_webhook_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_incoming_webhook_update_at ON public.incomingwebhooks USING btree (updateat);


--
-- Name: idx_incoming_webhook_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_incoming_webhook_user_id ON public.incomingwebhooks USING btree (userid);


--
-- Name: idx_jobs_status_type; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_jobs_status_type ON public.jobs USING btree (status, type);


--
-- Name: idx_jobs_type; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_jobs_type ON public.jobs USING btree (type);


--
-- Name: idx_link_metadata_url_timestamp; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_link_metadata_url_timestamp ON public.linkmetadata USING btree (url, "timestamp");


--
-- Name: idx_notice_views_notice_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_notice_views_notice_id ON public.productnoticeviewstate USING btree (noticeid);


--
-- Name: idx_notice_views_timestamp; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_notice_views_timestamp ON public.productnoticeviewstate USING btree ("timestamp");


--
-- Name: idx_oauthaccessdata_refresh_token; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_oauthaccessdata_refresh_token ON public.oauthaccessdata USING btree (refreshtoken);


--
-- Name: idx_oauthaccessdata_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_oauthaccessdata_user_id ON public.oauthaccessdata USING btree (userid);


--
-- Name: idx_oauthapps_creator_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_oauthapps_creator_id ON public.oauthapps USING btree (creatorid);


--
-- Name: idx_outgoing_webhook_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_outgoing_webhook_create_at ON public.outgoingwebhooks USING btree (createat);


--
-- Name: idx_outgoing_webhook_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_outgoing_webhook_delete_at ON public.outgoingwebhooks USING btree (deleteat);


--
-- Name: idx_outgoing_webhook_team_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_outgoing_webhook_team_id ON public.outgoingwebhooks USING btree (teamid);


--
-- Name: idx_outgoing_webhook_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_outgoing_webhook_update_at ON public.outgoingwebhooks USING btree (updateat);


--
-- Name: idx_posts_channel_id_delete_at_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_channel_id_delete_at_create_at ON public.posts USING btree (channelid, deleteat, createat);


--
-- Name: idx_posts_channel_id_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_channel_id_update_at ON public.posts USING btree (channelid, updateat);


--
-- Name: idx_posts_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_create_at ON public.posts USING btree (createat);


--
-- Name: idx_posts_create_at_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_create_at_id ON public.posts USING btree (createat, id);


--
-- Name: idx_posts_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_delete_at ON public.posts USING btree (deleteat);


--
-- Name: idx_posts_hashtags_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_hashtags_txt ON public.posts USING gin (to_tsvector('english'::regconfig, (hashtags)::text));


--
-- Name: idx_posts_is_pinned; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_is_pinned ON public.posts USING btree (ispinned);


--
-- Name: idx_posts_message_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_message_txt ON public.posts USING gin (to_tsvector('english'::regconfig, (message)::text));


--
-- Name: idx_posts_root_id_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_root_id_delete_at ON public.posts USING btree (rootid, deleteat);


--
-- Name: idx_posts_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_update_at ON public.posts USING btree (updateat);


--
-- Name: idx_posts_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_user_id ON public.posts USING btree (userid);


--
-- Name: idx_preferences_category; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_preferences_category ON public.preferences USING btree (category);


--
-- Name: idx_preferences_name; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_preferences_name ON public.preferences USING btree (name);


--
-- Name: idx_publicchannels_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_publicchannels_delete_at ON public.publicchannels USING btree (deleteat);


--
-- Name: idx_publicchannels_displayname_lower; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_publicchannels_displayname_lower ON public.publicchannels USING btree (lower((displayname)::text));


--
-- Name: idx_publicchannels_name_lower; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_publicchannels_name_lower ON public.publicchannels USING btree (lower((name)::text));


--
-- Name: idx_publicchannels_search_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_publicchannels_search_txt ON public.publicchannels USING gin (to_tsvector('english'::regconfig, (((((name)::text || ' '::text) || (displayname)::text) || ' '::text) || (purpose)::text)));


--
-- Name: idx_publicchannels_team_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_publicchannels_team_id ON public.publicchannels USING btree (teamid);


--
-- Name: idx_reactions_channel_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_reactions_channel_id ON public.reactions USING btree (channelid);


--
-- Name: idx_retentionpolicies_displayname; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_retentionpolicies_displayname ON public.retentionpolicies USING btree (displayname);


--
-- Name: idx_retentionpolicieschannels_policyid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_retentionpolicieschannels_policyid ON public.retentionpolicieschannels USING btree (policyid);


--
-- Name: idx_retentionpoliciesteams_policyid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_retentionpoliciesteams_policyid ON public.retentionpoliciesteams USING btree (policyid);


--
-- Name: idx_schemes_channel_admin_role; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_schemes_channel_admin_role ON public.schemes USING btree (defaultchanneladminrole);


--
-- Name: idx_schemes_channel_guest_role; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_schemes_channel_guest_role ON public.schemes USING btree (defaultchannelguestrole);


--
-- Name: idx_schemes_channel_user_role; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_schemes_channel_user_role ON public.schemes USING btree (defaultchanneluserrole);


--
-- Name: idx_sessions_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_sessions_create_at ON public.sessions USING btree (createat);


--
-- Name: idx_sessions_expires_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_sessions_expires_at ON public.sessions USING btree (expiresat);


--
-- Name: idx_sessions_last_activity_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_sessions_last_activity_at ON public.sessions USING btree (lastactivityat);


--
-- Name: idx_sessions_token; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_sessions_token ON public.sessions USING btree (token);


--
-- Name: idx_sessions_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_sessions_user_id ON public.sessions USING btree (userid);


--
-- Name: idx_sharedchannelusers_remote_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_sharedchannelusers_remote_id ON public.sharedchannelusers USING btree (remoteid);


--
-- Name: idx_sidebarcategories_userid_teamid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_sidebarcategories_userid_teamid ON public.sidebarcategories USING btree (userid, teamid);


--
-- Name: idx_status_status_dndendtime; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_status_status_dndendtime ON public.status USING btree (status, dndendtime);


--
-- Name: idx_teammembers_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_teammembers_delete_at ON public.teammembers USING btree (deleteat);


--
-- Name: idx_teammembers_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_teammembers_user_id ON public.teammembers USING btree (userid);


--
-- Name: idx_teams_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_teams_create_at ON public.teams USING btree (createat);


--
-- Name: idx_teams_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_teams_delete_at ON public.teams USING btree (deleteat);


--
-- Name: idx_teams_invite_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_teams_invite_id ON public.teams USING btree (inviteid);


--
-- Name: idx_teams_scheme_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_teams_scheme_id ON public.teams USING btree (schemeid);


--
-- Name: idx_teams_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_teams_update_at ON public.teams USING btree (updateat);


--
-- Name: idx_thread_memberships_last_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_thread_memberships_last_update_at ON public.threadmemberships USING btree (lastupdated);


--
-- Name: idx_thread_memberships_last_view_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_thread_memberships_last_view_at ON public.threadmemberships USING btree (lastviewed);


--
-- Name: idx_thread_memberships_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_thread_memberships_user_id ON public.threadmemberships USING btree (userid);


--
-- Name: idx_threads_channel_id_last_reply_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_threads_channel_id_last_reply_at ON public.threads USING btree (channelid, lastreplyat);


--
-- Name: idx_uploadsessions_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_uploadsessions_create_at ON public.uploadsessions USING btree (createat);


--
-- Name: idx_uploadsessions_type; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_uploadsessions_type ON public.uploadsessions USING btree (type);


--
-- Name: idx_uploadsessions_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_uploadsessions_user_id ON public.uploadsessions USING btree (userid);


--
-- Name: idx_user_access_tokens_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_user_access_tokens_user_id ON public.useraccesstokens USING btree (userid);


--
-- Name: idx_usergroups_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_usergroups_delete_at ON public.usergroups USING btree (deleteat);


--
-- Name: idx_usergroups_displayname; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_usergroups_displayname ON public.usergroups USING btree (displayname);


--
-- Name: idx_usergroups_remote_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_usergroups_remote_id ON public.usergroups USING btree (remoteid);


--
-- Name: idx_users_all_no_full_name_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_all_no_full_name_txt ON public.users USING gin (to_tsvector('english'::regconfig, (((((username)::text || ' '::text) || (nickname)::text) || ' '::text) || (email)::text)));


--
-- Name: idx_users_all_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_all_txt ON public.users USING gin (to_tsvector('english'::regconfig, (((((((((username)::text || ' '::text) || (firstname)::text) || ' '::text) || (lastname)::text) || ' '::text) || (nickname)::text) || ' '::text) || (email)::text)));


--
-- Name: idx_users_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_create_at ON public.users USING btree (createat);


--
-- Name: idx_users_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_delete_at ON public.users USING btree (deleteat);


--
-- Name: idx_users_email_lower_textpattern; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_email_lower_textpattern ON public.users USING btree (lower((email)::text) text_pattern_ops);


--
-- Name: idx_users_firstname_lower_textpattern; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_firstname_lower_textpattern ON public.users USING btree (lower((firstname)::text) text_pattern_ops);


--
-- Name: idx_users_lastname_lower_textpattern; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_lastname_lower_textpattern ON public.users USING btree (lower((lastname)::text) text_pattern_ops);


--
-- Name: idx_users_names_no_full_name_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_names_no_full_name_txt ON public.users USING gin (to_tsvector('english'::regconfig, (((username)::text || ' '::text) || (nickname)::text)));


--
-- Name: idx_users_names_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_names_txt ON public.users USING gin (to_tsvector('english'::regconfig, (((((((username)::text || ' '::text) || (firstname)::text) || ' '::text) || (lastname)::text) || ' '::text) || (nickname)::text)));


--
-- Name: idx_users_nickname_lower_textpattern; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_nickname_lower_textpattern ON public.users USING btree (lower((nickname)::text) text_pattern_ops);


--
-- Name: idx_users_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_update_at ON public.users USING btree (updateat);


--
-- Name: idx_users_username_lower_textpattern; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_username_lower_textpattern ON public.users USING btree (lower((username)::text) text_pattern_ops);


--
-- Name: ir_channelaction_channelid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_channelaction_channelid ON public.ir_channelaction USING btree (channelid);


--
-- Name: ir_incident_channelid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_incident_channelid ON public.ir_incident USING btree (channelid);


--
-- Name: ir_incident_teamid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_incident_teamid ON public.ir_incident USING btree (teamid);


--
-- Name: ir_incident_teamid_commanderuserid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_incident_teamid_commanderuserid ON public.ir_incident USING btree (teamid, commanderuserid);


--
-- Name: ir_metric_incidentid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_metric_incidentid ON public.ir_metric USING btree (incidentid);


--
-- Name: ir_metric_metricconfigid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_metric_metricconfigid ON public.ir_metric USING btree (metricconfigid);


--
-- Name: ir_metricconfig_playbookid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_metricconfig_playbookid ON public.ir_metricconfig USING btree (playbookid);


--
-- Name: ir_playbook_teamid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_playbook_teamid ON public.ir_playbook USING btree (teamid);


--
-- Name: ir_playbook_updateat; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_playbook_updateat ON public.ir_playbook USING btree (updateat);


--
-- Name: ir_playbookmember_memberid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_playbookmember_memberid ON public.ir_playbookmember USING btree (memberid);


--
-- Name: ir_playbookmember_playbookid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_playbookmember_playbookid ON public.ir_playbookmember USING btree (playbookid);


--
-- Name: ir_run_participants_incidentid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_run_participants_incidentid ON public.ir_run_participants USING btree (incidentid);


--
-- Name: ir_run_participants_userid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_run_participants_userid ON public.ir_run_participants USING btree (userid);


--
-- Name: ir_statusposts_incidentid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_statusposts_incidentid ON public.ir_statusposts USING btree (incidentid);


--
-- Name: ir_statusposts_postid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_statusposts_postid ON public.ir_statusposts USING btree (postid);


--
-- Name: ir_timelineevent_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_timelineevent_id ON public.ir_timelineevent USING btree (id);


--
-- Name: ir_timelineevent_incidentid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_timelineevent_incidentid ON public.ir_timelineevent USING btree (incidentid);


--
-- Name: remote_clusters_site_url_unique; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE UNIQUE INDEX remote_clusters_site_url_unique ON public.remoteclusters USING btree (siteurl, remoteteamid);


--
-- Name: retentionpolicieschannels fk_retentionpolicieschannels_retentionpolicies; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.retentionpolicieschannels
    ADD CONSTRAINT fk_retentionpolicieschannels_retentionpolicies FOREIGN KEY (policyid) REFERENCES public.retentionpolicies(id) ON DELETE CASCADE;


--
-- Name: retentionpoliciesteams fk_retentionpoliciesteams_retentionpolicies; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.retentionpoliciesteams
    ADD CONSTRAINT fk_retentionpoliciesteams_retentionpolicies FOREIGN KEY (policyid) REFERENCES public.retentionpolicies(id) ON DELETE CASCADE;


--
-- Name: ir_metric ir_metric_incidentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_metric
    ADD CONSTRAINT ir_metric_incidentid_fkey FOREIGN KEY (incidentid) REFERENCES public.ir_incident(id);


--
-- Name: ir_metric ir_metric_metricconfigid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_metric
    ADD CONSTRAINT ir_metric_metricconfigid_fkey FOREIGN KEY (metricconfigid) REFERENCES public.ir_metricconfig(id);


--
-- Name: ir_metricconfig ir_metricconfig_playbookid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_metricconfig
    ADD CONSTRAINT ir_metricconfig_playbookid_fkey FOREIGN KEY (playbookid) REFERENCES public.ir_playbook(id);


--
-- Name: ir_playbookautofollow ir_playbookautofollow_playbookid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_playbookautofollow
    ADD CONSTRAINT ir_playbookautofollow_playbookid_fkey FOREIGN KEY (playbookid) REFERENCES public.ir_playbook(id);


--
-- Name: ir_playbookmember ir_playbookmember_playbookid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_playbookmember
    ADD CONSTRAINT ir_playbookmember_playbookid_fkey FOREIGN KEY (playbookid) REFERENCES public.ir_playbook(id);


--
-- Name: ir_run_participants ir_run_participants_incidentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_run_participants
    ADD CONSTRAINT ir_run_participants_incidentid_fkey FOREIGN KEY (incidentid) REFERENCES public.ir_incident(id);


--
-- Name: ir_statusposts ir_statusposts_incidentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_statusposts
    ADD CONSTRAINT ir_statusposts_incidentid_fkey FOREIGN KEY (incidentid) REFERENCES public.ir_incident(id);


--
-- Name: ir_timelineevent ir_timelineevent_incidentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_timelineevent
    ADD CONSTRAINT ir_timelineevent_incidentid_fkey FOREIGN KEY (incidentid) REFERENCES public.ir_incident(id);


--
-- PostgreSQL database dump complete
--

